Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 903FA645A13
	for <lists+linux-omap@lfdr.de>; Wed,  7 Dec 2022 13:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiLGMnM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Dec 2022 07:43:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiLGMnM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Dec 2022 07:43:12 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2560BF31;
        Wed,  7 Dec 2022 04:43:10 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CB295804D;
        Wed,  7 Dec 2022 12:43:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 1/1] serial: core: Start managing serial controllers to enable runtime PM
Date:   Wed,  7 Dec 2022 14:43:05 +0200
Message-Id: <20221207124305.49943-1-tony@atomide.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We want to enable runtime PM for serial port device drivers in a generic
way. To do this, we want to have the serial core layer manage the
registered physical serial controller devices.

To do this, let's set up a struct device for the serial core controller
as suggested by Greg and Jiri. The serial core controller devices are
children of the physical serial port device. The serial core controller
device is needed to support multiple different kind of ports connected
to single physical serial port device.

Let's also set up a struct device for the serial core port. The serial
core port instances are children of the serial core controller device.
With the serial core port device we can now flush pending TX on the
runtime PM resume as suggested by Johan.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Jiri Slaby <jirislaby@kernel.org>
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Changes since v3:

- Simplify things by adding a serial core control device as the child of
  the physical serial port as suggested by Jiri

- Drop the tinkering of the physical serial port device for runtime PM.
  Serial core just needs to manage port->port_dev with the addition of
  the serial core control device and the device hierarchy will keep the
  pysical serial port device enabled as needed

- Simplify patch description with all the runtime PM tinkering gone

- Coding style improvments as noted by Andy

- Post as a single RFC patch as we're close to the merge window

Changes since v2:

- Make each serial port a proper device as suggested by Greg. This is
  a separate patch that flushes the TX on runtime PM resume

Changes since v1:

- Use kref as suggested by Andy

- Fix memory leak on error as noted by Andy

- Use use unsigned char for supports_autosuspend as suggested by Andy

- Coding style improvments as suggested by Andy

---
 drivers/tty/serial/8250/8250_core.c |   1 +
 drivers/tty/serial/Makefile         |   2 +-
 drivers/tty/serial/serial_core.c    | 184 ++++++++++++++++++++++++++--
 drivers/tty/serial/serial_ctrl.c    |  61 +++++++++
 drivers/tty/serial/serial_ctrl.h    |  19 +++
 drivers/tty/serial/serial_port.c    | 108 ++++++++++++++++
 include/linux/serial_core.h         |   4 +-
 7 files changed, 370 insertions(+), 9 deletions(-)
 create mode 100644 drivers/tty/serial/serial_ctrl.c
 create mode 100644 drivers/tty/serial/serial_ctrl.h
 create mode 100644 drivers/tty/serial/serial_port.c

diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -995,6 +995,7 @@ int serial8250_register_8250_port(const struct uart_8250_port *up)
 		if (uart->port.dev)
 			uart_remove_one_port(&serial8250_reg, &uart->port);
 
+		uart->port.ctrl_id	= up->port.ctrl_id;
 		uart->port.iobase       = up->port.iobase;
 		uart->port.membase      = up->port.membase;
 		uart->port.irq          = up->port.irq;
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -3,7 +3,7 @@
 # Makefile for the kernel serial device drivers.
 #
 
-obj-$(CONFIG_SERIAL_CORE) += serial_core.o
+obj-$(CONFIG_SERIAL_CORE) += serial_core.o serial_ctrl.o serial_port.o
 
 obj-$(CONFIG_SERIAL_EARLYCON) += earlycon.o
 obj-$(CONFIG_SERIAL_EARLYCON_ARM_SEMIHOST) += earlycon-arm-semihost.o
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -16,6 +16,8 @@
 #include <linux/console.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include <linux/device.h>
@@ -30,6 +32,8 @@
 #include <linux/irq.h>
 #include <linux/uaccess.h>
 
+#include "serial_ctrl.h"
+
 /*
  * This is used to lock changes in serial line configuration.
  */
@@ -136,9 +140,31 @@ static void __uart_start(struct tty_struct *tty)
 {
 	struct uart_state *state = tty->driver_data;
 	struct uart_port *port = state->uart_port;
+	struct device *port_dev;
+	int err;
+
+	if (!port || uart_tx_stopped(port))
+		return;
 
-	if (port && !uart_tx_stopped(port))
+	port_dev = port->port_dev;
+
+	err = pm_runtime_get(port_dev);
+	if (err < 0) {
+		/* Something went wrong, attempt to start TX anyways */
 		port->ops->start_tx(port);
+		pm_runtime_put_noidle(port_dev);
+		return;
+	}
+
+	/*
+	 * Start TX if enabled, and kick runtime PM. Otherwise we must
+	 * wait for a retry. See also serial_port.c for runtime PM
+	 * autosuspend timeout.
+	 */
+	if (pm_runtime_active(port_dev))
+		port->ops->start_tx(port);
+	pm_runtime_mark_last_busy(port_dev);
+	pm_runtime_put_autosuspend(port_dev);
 }
 
 static void uart_start(struct tty_struct *tty)
@@ -3035,7 +3061,7 @@ static const struct attribute_group tty_dev_attr_group = {
 };
 
 /**
- * uart_add_one_port - attach a driver-defined port structure
+ * serial_core_add_one_port - attach a driver-defined port structure
  * @drv: pointer to the uart low level driver structure for this port
  * @uport: uart port structure to use for this port.
  *
@@ -3045,7 +3071,7 @@ static const struct attribute_group tty_dev_attr_group = {
  * core driver. The main purpose is to allow the low level uart drivers to
  * expand uart_port, rather than having yet more levels of structures.
  */
-int uart_add_one_port(struct uart_driver *drv, struct uart_port *uport)
+static int serial_core_add_one_port(struct uart_driver *drv, struct uart_port *uport)
 {
 	struct uart_state *state;
 	struct tty_port *port;
@@ -3135,10 +3161,9 @@ int uart_add_one_port(struct uart_driver *drv, struct uart_port *uport)
 
 	return ret;
 }
-EXPORT_SYMBOL(uart_add_one_port);
 
 /**
- * uart_remove_one_port - detach a driver defined port structure
+ * serial_core_remove_one_port - detach a driver defined port structure
  * @drv: pointer to the uart low level driver structure for this port
  * @uport: uart port structure for this port
  *
@@ -3147,7 +3172,8 @@ EXPORT_SYMBOL(uart_add_one_port);
  * This unhooks (and hangs up) the specified port structure from the core
  * driver. No further calls will be made to the low-level code for this port.
  */
-int uart_remove_one_port(struct uart_driver *drv, struct uart_port *uport)
+static int serial_core_remove_one_port(struct uart_driver *drv,
+				       struct uart_port *uport)
 {
 	struct uart_state *state = drv->state + uport->line;
 	struct tty_port *port = &state->port;
@@ -3215,7 +3241,6 @@ int uart_remove_one_port(struct uart_driver *drv, struct uart_port *uport)
 
 	return ret;
 }
-EXPORT_SYMBOL(uart_remove_one_port);
 
 /**
  * uart_match_port - are the two ports equivalent?
@@ -3250,6 +3275,151 @@ bool uart_match_port(const struct uart_port *port1,
 }
 EXPORT_SYMBOL(uart_match_port);
 
+/*
+ * Find a registered serial core controller device if one exists. Returns
+ * the first device matching the ctrl_id. Caller must hold port_mutex.
+ */
+static struct device *serial_core_ctrl_find(struct uart_driver *drv,
+					    struct device *phys_dev,
+					    int ctrl_id)
+{
+	struct uart_state *state;
+	int i;
+
+	lockdep_assert_held(&port_mutex);
+
+	for (i = 0; i < drv->nr; i++) {
+		state = drv->state + i;
+		if (!state->uart_port || !state->uart_port->port_dev)
+			continue;
+
+		if (state->uart_port->dev == phys_dev &&
+		    state->uart_port->ctrl_id == ctrl_id)
+			return state->uart_port->port_dev->parent;
+	}
+
+	return NULL;
+}
+
+static struct platform_device *serial_core_device_add(struct uart_port *port,
+						      const char *name,
+						      struct device *parent_dev,
+						      void *pdata,
+						      int pdata_size)
+{
+	struct platform_device_info pinfo;
+
+	memset(&pinfo, 0, sizeof(pinfo));
+	pinfo.name = name;
+	pinfo.id = PLATFORM_DEVID_AUTO;
+	pinfo.parent = parent_dev;
+	pinfo.data = pdata;
+	pinfo.size_data = pdata_size;
+
+	return platform_device_register_full(&pinfo);
+}
+
+static struct device *serial_core_ctrl_device_add(struct uart_port *port)
+{
+	struct platform_device *pdev;
+
+	pdev = serial_core_device_add(port, "serial-ctrl", port->dev, NULL, 0);
+	if (IS_ERR(pdev))
+		return NULL;
+
+	return &pdev->dev;
+}
+
+static int serial_core_port_device_add(struct device *ctrl_dev, struct uart_port *port)
+{
+	struct serial_port_platdata pdata;
+	struct platform_device *pdev;
+
+	memset(&pdata, 0, sizeof(pdata));
+	pdata.port = port;
+
+	pdev = serial_core_device_add(port, "serial-port", ctrl_dev, &pdata,
+				      sizeof(pdata));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	port->port_dev = &pdev->dev;
+
+	return 0;
+}
+
+/*
+ * Initialize a serial core port device, and a controller device if needed.
+ */
+int serial_core_register_port(struct uart_driver *drv, struct uart_port *port)
+{
+	bool allocated = false;
+	struct device *ctrl_dev;
+	int ret;
+
+	ret = serial_core_add_one_port(drv, port);
+	if (ret)
+		return ret;
+
+	mutex_lock(&port_mutex);
+
+	/* Inititalize a serial core controller device if needed */
+	ctrl_dev = serial_core_ctrl_find(drv, port->dev, port->ctrl_id);
+	if (!ctrl_dev) {
+		ctrl_dev = serial_core_ctrl_device_add(port);
+		if (!ctrl_dev)
+			goto err_remove_port;
+		allocated = true;
+	}
+
+	/* Initialize a serial core port device */
+	ret = serial_core_port_device_add(ctrl_dev, port);
+	if (ret)
+		goto err_del_ctrl_dev;
+
+	mutex_unlock(&port_mutex);
+
+	return 0;
+
+err_del_ctrl_dev:
+	if (allocated)
+		platform_device_del(to_platform_device(ctrl_dev));
+
+err_remove_port:
+	mutex_unlock(&port_mutex);
+
+	return serial_core_remove_one_port(drv, port);
+}
+EXPORT_SYMBOL_NS(serial_core_register_port, SERIAL_CORE);
+
+/*
+ * Removes a serial core port device, and the related serial core controller
+ * device if the last instance.
+ */
+void serial_core_unregister_port(struct uart_driver *drv, struct uart_port *port)
+{
+	struct device *port_dev = port->port_dev;
+	struct device *ctrl_dev = port_dev->parent;
+
+	mutex_lock(&port_mutex);
+
+	platform_device_del(to_platform_device(port_dev));
+	port->port_dev = NULL;
+
+	mutex_unlock(&port_mutex);
+
+	serial_core_remove_one_port(drv, port);
+
+	mutex_lock(&port_mutex);
+
+	/* Drop the serial core controller device if no ports are using it */
+	if (!serial_core_ctrl_find(drv, port->dev, port->ctrl_id))
+		platform_device_del(to_platform_device(ctrl_dev));
+
+	mutex_unlock(&port_mutex);
+}
+EXPORT_SYMBOL_NS(serial_core_unregister_port, SERIAL_CORE);
+
 /**
  * uart_handle_dcd_change - handle a change of carrier detect state
  * @uport: uart_port structure for the open port
diff --git a/drivers/tty/serial/serial_ctrl.c b/drivers/tty/serial/serial_ctrl.c
new file mode 100644
--- /dev/null
+++ b/drivers/tty/serial/serial_ctrl.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/*
+ * Serial core controller driver
+ *
+ * This driver manages the serial core controller struct device instances.
+ * The serial core controller devices are children of the physical serial
+ * port device.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/serial_core.h>
+
+#include "serial_ctrl.h"
+
+static int serial_ctrl_probe(struct platform_device *pdev)
+{
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+static int serial_ctrl_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static struct platform_driver serial_ctrl_driver = {
+	.driver = {
+		.name = "serial-ctrl",
+		.suppress_bind_attrs = true,
+	},
+	.probe = serial_ctrl_probe,
+	.remove = serial_ctrl_remove,
+};
+module_platform_driver(serial_ctrl_driver);
+
+/*
+ * Serial core controller device init functions. Note that the physical
+ * serial port device driver may not have completed probe at this point.
+ */
+int serial_ctrl_register_port(struct uart_driver *drv, struct uart_port *port)
+{
+	return serial_core_register_port(drv, port);
+}
+EXPORT_SYMBOL_NS(serial_ctrl_register_port, SERIAL_CORE);
+
+void serial_ctrl_unregister_port(struct uart_driver *drv, struct uart_port *port)
+{
+	serial_core_unregister_port(drv, port);
+}
+EXPORT_SYMBOL_NS(serial_ctrl_unregister_port, SERIAL_CORE);
+
+MODULE_AUTHOR("Tony Lindgren <tony@atomide.com>");
+MODULE_DESCRIPTION("Serial core controller driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(SERIAL_CORE);
diff --git a/drivers/tty/serial/serial_ctrl.h b/drivers/tty/serial/serial_ctrl.h
new file mode 100644
--- /dev/null
+++ b/drivers/tty/serial/serial_ctrl.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Serial core controller data. Serial port device drivers do not need this. */
+
+/**
+ * struct serial_port_platdata - Serial port platform data
+ * @state: serial port state
+ *
+ * Used by serial_core and serial_port only. Allocated on uart_add_one_port(),
+ * and freed on uart_remove_one_port().
+ */
+struct serial_port_platdata {
+	struct uart_port *port;
+};
+
+extern int serial_ctrl_register_port(struct uart_driver *drv, struct uart_port *port);
+extern void serial_ctrl_unregister_port(struct uart_driver *drv, struct uart_port *port);
+extern int serial_core_register_port(struct uart_driver *drv, struct uart_port *port);
+extern void serial_core_unregister_port(struct uart_driver *drv, struct uart_port *port);
diff --git a/drivers/tty/serial/serial_port.c b/drivers/tty/serial/serial_port.c
new file mode 100644
--- /dev/null
+++ b/drivers/tty/serial/serial_port.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/*
+ * Serial core port device driver
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/serial_core.h>
+
+#include "serial_ctrl.h"
+
+#define SERIAL_PORT_AUTOSUSPEND_DELAY_MS	500
+
+struct serial_port_data {
+	struct uart_port *port;
+};
+
+/* Only considers pending TX for now. Caller must take care of locking */
+static int __serial_port_busy(struct uart_port *port)
+{
+	return !uart_tx_stopped(port) &&
+		uart_circ_chars_pending(&port->state->xmit);
+}
+
+static int serial_port_runtime_resume(struct device *dev)
+{
+	struct serial_port_data *ddata = dev_get_drvdata(dev);
+	struct uart_port *port = ddata->port;
+	unsigned long flags;
+
+	/* Flush any pending TX for the port */
+	spin_lock_irqsave(&port->lock, flags);
+	if (__serial_port_busy(port))
+		port->ops->start_tx(port);
+	spin_unlock_irqrestore(&port->lock, flags);
+	pm_runtime_mark_last_busy(dev);
+
+	return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(serial_port_pm, NULL,
+				 serial_port_runtime_resume, NULL);
+
+static int serial_port_probe(struct platform_device *pdev)
+{
+	struct serial_port_platdata *pd = dev_get_platdata(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	struct serial_port_data *ddata;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->port = pd->port;
+	platform_set_drvdata(pdev, ddata);
+
+	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, SERIAL_PORT_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+
+	return 0;
+}
+
+static int serial_port_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+
+	return 0;
+}
+
+static struct platform_driver serial_port_driver = {
+	.driver = {
+		.name = "serial-port",
+		.suppress_bind_attrs = true,
+		.pm = pm_ptr(&serial_port_pm),
+	},
+	.probe = serial_port_probe,
+	.remove = serial_port_remove,
+};
+module_platform_driver(serial_port_driver);
+
+/*
+ * Serial core port device init functions. Note that the physical serial
+ * port device driver may not have completed probe at this point.
+ */
+int uart_add_one_port(struct uart_driver *drv, struct uart_port *port)
+{
+	return serial_ctrl_register_port(drv, port);
+}
+EXPORT_SYMBOL(uart_add_one_port);
+
+int uart_remove_one_port(struct uart_driver *drv, struct uart_port *port)
+{
+	serial_ctrl_unregister_port(drv, port);
+
+	return 0;
+}
+EXPORT_SYMBOL(uart_remove_one_port);
+
+MODULE_AUTHOR("Tony Lindgren <tony@atomide.com>");
+MODULE_DESCRIPTION("Serial controller port driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(SERIAL_CORE);
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -458,6 +458,7 @@ struct uart_port {
 						struct serial_rs485 *rs485);
 	int			(*iso7816_config)(struct uart_port *,
 						  struct serial_iso7816 *iso7816);
+	int			ctrl_id;		/* optional serial core controller id */
 	unsigned int		irq;			/* irq number */
 	unsigned long		irqflags;		/* irq flags  */
 	unsigned int		uartclk;		/* base uart clock */
@@ -563,7 +564,8 @@ struct uart_port {
 	unsigned int		minor;
 	resource_size_t		mapbase;		/* for ioremap */
 	resource_size_t		mapsize;
-	struct device		*dev;			/* parent device */
+	struct device		*dev;			/* serial port physical parent device */
+	struct device		*port_dev;		/* serial core port device */
 
 	unsigned long		sysrq;			/* sysrq timeout */
 	unsigned int		sysrq_ch;		/* char for sysrq */
-- 
2.38.1
