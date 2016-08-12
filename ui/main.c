#include <glib/gi18n.h>
#include <gtk/gtk.h>

GtkWidget * activate (GtkApplication* app){

    GtkWidget *window;
    GtkWidget *hbox;
    GtkWidget *regex_button;
    GtkWidget *case_button;
    GtkWidget *whole_button;
    GtkWidget *continue_button;
    GtkWidget *selection_button;
    GtkWidget *highlight_button;
    GtkWidget *entry;
    GtkWidget *find_button;
    GtkWidget *find_prev_button;
    GtkWidget *find_all_button;
    GtkEntryBuffer *buffer;
    GtkCssProvider *css;

    window = gtk_application_window_new(app);
    gtk_window_set_decorated(GTK_WINDOW(window), FALSE);
    gtk_window_set_resizable(GTK_WINDOW(window), FALSE);
    gtk_window_set_keep_above(GTK_WINDOW(window), TRUE);
    gtk_window_set_skip_taskbar_hint(GTK_WINDOW(window), TRUE);
    gtk_window_set_skip_pager_hint(GTK_WINDOW(window), TRUE);

    css = gtk_css_provider_new();
    gtk_css_provider_load_from_path(css, "theme.css", NULL);
    gtk_style_context_add_provider_for_screen(gtk_window_get_screen(GTK_WINDOW(window)),
                                              GTK_STYLE_PROVIDER(css),
                                              GTK_STYLE_PROVIDER_PRIORITY_USER);

    hbox = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_container_add(GTK_CONTAINER(window), hbox);

    regex_button = gtk_button_new_with_label("\uf081");
    gtk_box_pack_start(GTK_BOX(hbox), regex_button, FALSE, FALSE, 0);

    case_button = gtk_button_new_with_label("\uf081");
    gtk_box_pack_start(GTK_BOX(hbox), case_button, FALSE, FALSE, 0);

    whole_button = gtk_button_new_with_label("\uf081");
    gtk_box_pack_start(GTK_BOX(hbox), whole_button, FALSE, FALSE, 0);

    continue_button = gtk_button_new_with_label("\uf081");
    gtk_box_pack_start(GTK_BOX(hbox), continue_button, FALSE, FALSE, 0);

    selection_button = gtk_button_new_with_label("\uf081");
    gtk_box_pack_start(GTK_BOX(hbox), selection_button, FALSE, FALSE, 0);

    highlight_button = gtk_button_new_with_label("\uf081");
    gtk_box_pack_start(GTK_BOX(hbox), highlight_button, FALSE, FALSE, 0);

    buffer = gtk_entry_buffer_new(NULL, 0);

    entry = gtk_entry_new_with_buffer(buffer);
    gtk_entry_grab_focus_without_selecting(GTK_ENTRY(entry));
    gtk_box_pack_start(GTK_BOX(hbox), entry, FALSE, FALSE, 0);

    find_button = gtk_button_new_with_label("Find");
    gtk_widget_set_name(find_button, "butono");
    gtk_box_pack_start(GTK_BOX(hbox), find_button, FALSE, FALSE, 0);

    find_prev_button = gtk_button_new_with_label("Find Prev");
    gtk_box_pack_start(GTK_BOX(hbox), find_prev_button, FALSE, FALSE, 0);

    find_all_button = gtk_button_new_with_label("Find All");
    gtk_box_pack_start(GTK_BOX(hbox), find_all_button, FALSE, FALSE, 0);

    g_object_unref(buffer);
    gtk_widget_show_all(window);
}

int main (int argc, char **argv){

    GtkApplication *app;
    int status;

    app = gtk_application_new("org.gtk.example", G_APPLICATION_FLAGS_NONE);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    return status;
}
