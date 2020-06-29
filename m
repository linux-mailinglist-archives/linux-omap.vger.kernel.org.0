Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595FE20D3BF
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jun 2020 21:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730451AbgF2TBr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jun 2020 15:01:47 -0400
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21698 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbgF2TBp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Jun 2020 15:01:45 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1593457296; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=TUreP8ji9wj4YE7ykkPVHqGyRt03K0RCpWiwK9U76xVAtvC50itrwaMu5c9cweIO8LuDUfhYfiYqiKdmxQb005xF3TmpX5fKbqqlJg5LUNOfN58mf4IkHdKu72gcPlTiWMEBQ3eD+Iff6u9rQ2sL1bgYUVOcGsPhOGJHDBjLhZo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1593457296; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=L4w8jW33dauocRaB/4ZEBAU9sKrxd5Mxc4JKnuaXdOY=; 
        b=OODIqVYcxGuRvZO4CRxkHYQDxgA70xNBJSWy8UUOLTKuc0Kd30mwHZvijusnAhMNA1xkGq1wBuWLrtLMXlTwsYekFWCOk8y2LR4ambaS8ietWGQ4m0+20YsI72wr14QxsDI1cMFxINXamiajsBbiT+7UUTb4aJNcZ76dwVDCyls=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=devnull@uvos.xyz;
        dmarc=pass header.from=<devnull@uvos.xyz> header.from=<devnull@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-212-254.hsi15.unitymediagroup.de [95.222.212.254]) by mx.zoho.eu
        with SMTPS id 1593457294913773.3332249669186; Mon, 29 Jun 2020 21:01:34 +0200 (CEST)
Date:   Mon, 29 Jun 2020 21:01:34 +0200
From:   Dev Null <devnull@uvos.xyz>
To:     linux-input@vger.kernel.org
Cc:     linux-omap@vger.kernel.org
Subject: [RFC PATCH] New driver to support permanent buttons on touchscreen
 surfaces, sutch as seen on the Motorola Droid 4
Message-Id: <20200629210134.203889d356422758d27244fd@uvos.xyz>
Organization: UVOS Organization
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This driver for supporting permanent buttons on touchscreen surfaces, as in ones that have permanent labeles, maybe a backlight but no other hardware indpendant from the touch screen. This was very common in android phones designed with android 1.0 to 2.3 in mind. The dirver works by attaching to another input device and mirroring its events, while inserting key events and filtering for touches that land on the buttons. Buttons are arbitrary rectangles configurable via dts, the patch includes sample configureation for the Droid 4. 

Known current limitations:

1. Driver is only multi touch aware in a limited capacity, i will pass and filter mt events but will not react to them on the buttons.
2. Driver is dependant on the Touchscreen driver supporing BTN_TOUCH, drivers that only report proximity will not work at this time.
3. Driver depends on the Touchscreen beeing on the i2c bus, a trival fix for this is in the pipeline.

Driver below:

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
index cef4d8abdaa1..33600e68076a 100644
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -175,7 +175,40 @@ pwm9: dmtimer-pwm-9 {
 		ti,timers = <&timer9>;
 		ti,clock-source = <0x01>;
 	};

+	mapphone_touchscreen {
+			compatible = "touchscreen-buttons";
+			touchscreen_phandle = <&touchscreen>;
+			menu {
+				x-position = <0>;
+				y-position = <950>;
+				x-size = <256>;
+				y-size = <74>;
+				keycode = <KEY_MENU>;
+			};
+			home {
+				x-position = <256>;
+				y-position = <950>;
+				x-size = <256>;
+				y-size = <74>;
+				keycode = <KEY_HOME>;
+			};
+			back {
+				x-position = <512>;
+				y-position = <950>;
+				x-size = <256>;
+				y-size = <74>;
+				keycode = <KEY_BACK>;
+			};
+			search {
+				x-position = <768>;
+				y-position = <950>;
+				x-size = <256>;
+				y-size = <74>;
+				keycode = <KEY_SEARCH>;
+			};
+	};
+
 	vibrator {
 		compatible = "pwm-vibrator";
 		pwms = <&pwm9 0 10000000 0>, <&pwm8 0 10000000 0>;
@@ -422,7 +455,7 @@ led@1 {
 };
 
 &i2c2 {
-	touchscreen@4a {
+	touchscreen: touchscreen@4a {
 		compatible = "atmel,maxtouch";
 		reg = <0x4a>;
 		pinctrl-names = "default";
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index d397ad4006f2..bd15ad5278d9 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -249,6 +249,7 @@ CONFIG_TOUCHSCREEN_TSC2005=m
 CONFIG_TOUCHSCREEN_TSC2007=m
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_CPCAP_PWRBUTTON=m
+CONFIG_INPUT_TOUCHSCREEN_BUTTONS=m
 CONFIG_INPUT_TPS65218_PWRBUTTON=m
 CONFIG_INPUT_TWL4030_PWRBUTTON=m
 CONFIG_INPUT_UINPUT=m
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 7e2e658d551c..2d55412eacd2 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -338,6 +338,14 @@ config INPUT_CPCAP_PWRBUTTON
 
 	  To compile this driver as a module, choose M here. The module will
 	  be called cpcap-pwrbutton.
+
+config INPUT_TOUCHSCREEN_BUTTONS
+	tristate "Touchscreen Buttons"
+	help
+	  Say Y here if you want to enable "virutal" buttons on touchscreen devices.
+
+	  To compile this driver as a module, choose M here. The module will
+	  be called touchscreen-buttons.
 
 config INPUT_WISTRON_BTNS
 	tristate "x86 Wistron laptop button interface"
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 8fd187f314bd..3b34378cb79f 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -85,4 +85,5 @@ obj-$(CONFIG_INPUT_WM831X_ON)		+= wm831x-on.o
 obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND)	+= xen-kbdfront.o
 obj-$(CONFIG_INPUT_YEALINK)		+= yealink.o
 obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR)	+= ideapad_slidebar.o
+obj-$(CONFIG_INPUT_TOUCHSCREEN_BUTTONS)	+= touchscreen-buttons.o
 
diff --git a/drivers/input/misc/touchscreen-buttons.c b/drivers/input/misc/touchscreen-buttons.c
new file mode 100644
index 000000000000..811fa98d12e6
--- /dev/null
+++ b/drivers/input/misc/touchscreen-buttons.c
@@ -0,0 +1,497 @@
+/**
+ * Touchscreen Virutal Button Input Driver
+ *
+ * Copyright (C) 2020 Carl Klemm <carl@uvos.xyz>
+ *
+ * This file is subject to the terms and conditions of the GNU General
+ * Public License. See the file "COPYING" in the main directory of this
+ * archive for more details.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/platform_device.h>
+#include <linux/errno.h>
+#include <linux/input.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/input/touchscreen-buttons.h>
+#include <linux/input/mt.h>
+#include <linux/i2c.h>
+#include<linux/string.h>
+
+#define EVENT_QUEUE_SIZE 32
+
+struct event {
+	unsigned int type;
+	unsigned int code;
+	int value;
+};
+
+struct event_queue {
+	struct event events[EVENT_QUEUE_SIZE];
+	unsigned int lastindex;
+};
+
+struct touchscreen_buttons {
+	struct device *dev;
+	struct input_dev *idev;
+	struct touchscreen_button_map *map;
+	struct input_handler *handler;
+	struct input_handle *ts_handle;
+	struct event_queue queue;
+};
+
+static const struct input_device_id touchscreen_buttons_ids[] = {
+	{
+	 .flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+	 .evbit = {BIT_MASK(EV_ABS)},
+	 },
+	{
+	 .flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+	 .evbit = {BIT_MASK(EV_KEY)},
+	 },
+	{
+	 .flags = INPUT_DEVICE_ID_MATCH_EVBIT,
+	 .evbit = {BIT_MASK(EV_SYN)},
+	 },
+	{},
+};
+
+static int touchscreen_buttons_process_syn(const struct event_queue *queue,
+					   const struct touchscreen_button_map
+					   *map, struct input_dev *idev)
+{
+	u32 i;
+	int x, y, ret, pressed;
+
+	x = INT_MIN;
+	y = INT_MIN;
+	pressed = -1;
+	ret = 0;
+
+	for (i = 0; i < queue->lastindex; ++i) {
+		const struct event *ev;
+
+		ev = &queue->events[i];
+		if (ev->type == EV_ABS && ev->code == ABS_X)
+			x = ev->value;
+		else if (ev->type == EV_ABS && ev->code == ABS_Y)
+			y = ev->value;
+		else if (ev->type == EV_KEY && ev->code == BTN_TOUCH)
+			pressed = ev->value;
+	}
+
+	for (i = 0; i < map->count; ++i) {
+		struct touchscreen_button *button = &map->buttons[i];
+
+		if (pressed == 1 &&
+		    button->x <= x &&
+		    button->y <= y &&
+		    button->width + button->x >= x &&
+		    button->height + button->y >= y && button->depressed == 0) {
+			input_report_key(idev, button->keycode, 1);
+			button->depressed = 1;
+			ret = 1;
+		} else if (button->depressed == 1) {
+			if (pressed == 0) {
+				input_report_key(idev, button->keycode, 0);
+				button->depressed = 0;
+			}
+			ret = 2;
+		}
+	}
+
+	if (ret != 0)
+		input_event(idev, EV_SYN, SYN_REPORT, 0);
+
+	return ret;
+}
+
+static void touchscreen_buttons_resend_events(const struct event_queue *queue,
+					      struct input_dev *idev)
+{
+	__u32 i;
+	for (i = 0; i < queue->lastindex; ++i) {
+		input_event(idev, queue->events[i].type, queue->events[i].code,
+			    queue->events[i].value);
+	}
+	input_event(idev, EV_SYN, SYN_REPORT, 0);
+}
+
+static void touchscreen_buttons_copy_mt_slots(struct input_dev *target,
+					      struct input_dev *source)
+{
+	if (source->mt && target->mt
+	    && source->mt->num_slots == target->mt->num_slots) {
+		memcpy(target->mt->slots, source->mt->slots,
+		       sizeof(struct input_mt_slot) * source->mt->num_slots);
+	}
+}
+
+static void touchscreen_buttons_input_event(struct input_handle *handle,
+					    unsigned int type,
+					    unsigned int code, int value)
+{
+
+	struct touchscreen_buttons *buttons;
+
+	buttons = handle->private;
+
+	if (type == EV_SYN && code == SYN_REPORT) {
+		if (touchscreen_buttons_process_syn
+		    (&buttons->queue, buttons->map, buttons->idev) == 0) {
+			touchscreen_buttons_resend_events(&buttons->queue,
+							  buttons->idev);
+		}
+		buttons->queue.lastindex = 0;
+	} else if (buttons->queue.lastindex < EVENT_QUEUE_SIZE
+		   && buttons->queue.lastindex >= 0) {
+		buttons->queue.events[buttons->queue.lastindex].type = type;
+		buttons->queue.events[buttons->queue.lastindex].code = code;
+		buttons->queue.events[buttons->queue.lastindex].value = value;
+		++buttons->queue.lastindex;
+	} else {
+		dev_warn(buttons->dev,
+			 "event_qeue overrun, will not caputure events until next SYN_REPORT\n");
+	}
+}
+
+static void touchscreen_buttons_merge_capabilitys(struct input_dev *target,
+						  struct input_dev *source)
+{
+	unsigned int i;
+	for (i = 0; i < BITS_TO_LONGS(INPUT_PROP_CNT); ++i)
+		target->propbit[i] = target->propbit[i] | source->propbit[i];
+	for (i = 0; i < BITS_TO_LONGS(EV_CNT); ++i)
+		target->evbit[i] = target->evbit[i] | source->evbit[i];
+	for (i = 0; i < BITS_TO_LONGS(KEY_CNT); ++i)
+		target->keybit[i] = target->keybit[i] | source->keybit[i];
+	for (i = 0; i < BITS_TO_LONGS(REL_CNT); ++i)
+		target->relbit[i] = target->relbit[i] | source->relbit[i];
+	for (i = 0; i < BITS_TO_LONGS(ABS_CNT); ++i)
+		target->absbit[i] = target->absbit[i] | source->absbit[i];
+	for (i = 0; i < BITS_TO_LONGS(MSC_CNT); ++i)
+		target->mscbit[i] = target->mscbit[i] | source->mscbit[i];
+	for (i = 0; i < BITS_TO_LONGS(LED_CNT); ++i)
+		target->ledbit[i] = target->ledbit[i] | source->ledbit[i];
+	for (i = 0; i < BITS_TO_LONGS(SND_CNT); ++i)
+		target->sndbit[i] = target->sndbit[i] | source->sndbit[i];
+	for (i = 0; i < BITS_TO_LONGS(FF_CNT); ++i)
+		target->ffbit[i] = target->ffbit[i] | source->ffbit[i];
+	for (i = 0; i < BITS_TO_LONGS(SW_CNT); ++i)
+		target->swbit[i] = target->swbit[i] | source->swbit[i];
+
+	if (*source->evbit & (1 << EV_ABS)) {
+		input_alloc_absinfo(target);
+		for (i = 0; i < ABS_CNT; ++i)
+			target->absinfo[i] = source->absinfo[i];
+		if (source->mt) {
+			input_mt_init_slots(target, source->mt->num_slots,
+					    source->mt->flags);
+			touchscreen_buttons_copy_mt_slots(target, source);
+		}
+	}
+
+}
+
+static int touchscreen_buttons_input_connect(struct input_handler *handler,
+					     struct input_dev *dev,
+					     const struct input_device_id *id)
+{
+	struct touchscreen_buttons *buttons;
+
+	buttons = handler->private;
+
+	if (!buttons->ts_handle
+	    && (buttons->map->ts_dev == &dev->dev
+		|| (dev->dev.parent
+		    && buttons->map->ts_dev == dev->dev.parent))) {
+		int error;
+
+		dev_info(buttons->dev, "Binding to device: %s\n",
+			 dev_name(&dev->dev));
+
+		buttons->ts_handle =
+		    kzalloc(sizeof(*buttons->ts_handle), GFP_KERNEL);
+		if (!buttons->ts_handle)
+			return -ENOMEM;
+
+		buttons->ts_handle->dev = dev;
+		buttons->ts_handle->handler = handler;
+		buttons->ts_handle->name = "touchscreen-buttons";
+		buttons->ts_handle->private = handler->private;
+		buttons->queue.lastindex = 0;
+
+		touchscreen_buttons_merge_capabilitys(buttons->idev, dev);
+
+		error = input_register_handle(buttons->ts_handle);
+		if (error) {
+			dev_err(buttons->dev,
+				"Failed to register input handler, error %d\n",
+				error);
+			kfree(buttons->ts_handle);
+			buttons->ts_handle = NULL;
+			return error;
+		}
+		if (buttons->idev->users > 0 && buttons->ts_handle->open == 0) {
+			error = input_open_device(buttons->ts_handle);
+			if (error) {
+				dev_err(buttons->dev,
+					"Failed to open input device, error %d\n",
+					error);
+				input_unregister_handle(buttons->ts_handle);
+				kfree(buttons->ts_handle);
+				buttons->ts_handle = NULL;
+				return error;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static void touchscreen_buttons_input_disconnect(struct input_handle *handle)
+{
+	struct touchscreen_buttons *buttons;
+
+	buttons = handle->private;
+
+	if (handle == buttons->ts_handle) {
+		input_close_device(handle);
+		input_unregister_handle(handle);
+		kfree(handle);
+		buttons->ts_handle = NULL;
+		dev_info(buttons->dev,
+			 "Touchscreen device disconnected, buttons disabled\n");
+	} else {
+		dev_err(buttons->dev,
+			"Unkown device disconnected, %p should be %p", handle,
+			buttons->ts_handle);
+	}
+}
+
+static struct touchscreen_button_map
+    *touchscreen_buttons_get_devtree_pdata(struct device *dev)
+{
+	struct touchscreen_button_map *map;
+	struct fwnode_handle *child_node;
+	struct device_node *touchscreen_node;
+	struct device *ts_dev;
+	struct device_node *node;
+	int i;
+
+	map = kzalloc(sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return ERR_PTR(-ENOMEM);
+
+	map->count = device_get_child_node_count(dev);
+	if (map->count == 0)
+		return ERR_PTR(-ENODEV);
+
+	map->buttons = kzalloc(sizeof(*map->buttons) * map->count, GFP_KERNEL);
+	if (!map->buttons)
+		return ERR_PTR(-ENOMEM);
+
+	node = dev->of_node;
+	touchscreen_node = of_parse_phandle(node, "touchscreen_phandle", 0);
+	if (!touchscreen_node) {
+		dev_err(dev, "touchscreen_phandle node missing\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	dev_info(dev, "Device_node name: %s\n", touchscreen_node->name);
+
+	ts_dev = bus_find_device_by_of_node(&i2c_bus_type, touchscreen_node);
+	if (!ts_dev) {
+		dev_err(dev,
+			"touchscreen_phandle points to non exsisting device\n");
+		return ERR_PTR(-ENODEV);
+	}
+	map->ts_dev = ts_dev;
+
+	dev_info(dev, "Will bind to device: %s\n", dev_name(map->ts_dev));
+
+	i = 0;
+	device_for_each_child_node(dev, child_node) {
+		struct touchscreen_button *button;
+		button = &map->buttons[i];
+		fwnode_property_read_u32(child_node, "x-position", &button->x);
+		fwnode_property_read_u32(child_node, "y-position", &button->y);
+		fwnode_property_read_u32(child_node, "x-size", &button->width);
+		fwnode_property_read_u32(child_node, "y-size", &button->height);
+		fwnode_property_read_u32(child_node, "keycode",
+					 &button->keycode);
+		dev_info(dev,
+			 "Adding button at x=%u y=%u size %u x %u keycode=%u\n",
+			 button->x, button->y, button->width, button->height,
+			 button->keycode);
+		++i;
+	}
+	return map;
+}
+
+int touchscreen_buttons_idev_opened(struct input_dev *idev)
+{
+	struct touchscreen_buttons *buttons;
+	buttons = dev_get_drvdata(idev->dev.parent);
+	if (buttons && buttons->ts_handle) {
+		if (buttons->ts_handle->open == 0) {
+			int error;
+
+			error = input_open_device(buttons->ts_handle);
+			if (error) {
+				dev_err(idev->dev.parent,
+					"Failed to open input device, error %d\n",
+					error);
+				input_unregister_handle(buttons->ts_handle);
+				kfree(buttons->ts_handle);
+				buttons->ts_handle = NULL;
+				return error;
+			}
+			dev_info(idev->dev.parent, "idev opened\n");
+		} else {
+			dev_info(idev->dev.parent, "idev allready opened\n");
+		}
+	} else {
+		dev_warn(idev->dev.parent,
+			 "Input device opend but touchscreen not open. %p %p\n",
+			 buttons, buttons->ts_handle);
+	}
+	return 0;
+}
+
+void touchscreen_buttons_idev_closed(struct input_dev *idev)
+{
+	struct touchscreen_buttons *buttons;
+	buttons = dev_get_drvdata(idev->dev.parent);
+	if (buttons && buttons->ts_handle && buttons->ts_handle->open != 0) {
+		input_close_device(buttons->ts_handle);
+		dev_info(idev->dev.parent, "idev closed\n");
+	}
+}
+
+static int touchscreen_buttons_probe(struct platform_device *pdev)
+{
+	struct touchscreen_buttons *buttons;
+	int error, i;
+
+	buttons = kzalloc(sizeof(*buttons), GFP_KERNEL);
+	if (!buttons)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, buttons);g
+
+	buttons->queue.lastindex = 0;
+
+	buttons->map = touchscreen_buttons_get_devtree_pdata(&pdev->dev);
+	if (IS_ERR(buttons->map))
+		return PTR_ERR(buttons->map);
+
+	/*input device */
+	buttons->idev = input_allocate_device();
+	if (!buttons->idev)
+		return -ENOMEM;
+
+	buttons->dev = &pdev->dev;
+
+	buttons->idev->name = "touchscreen-buttons";
+	buttons->idev->phys = "touchscreen-buttons/input0";
+	buttons->idev->dev.parent = buttons->dev;
+	buttons->idev->open = touchscreen_buttons_idev_opened;
+	buttons->idev->close = touchscreen_buttons_idev_closed;
+	for (i = 0; i < buttons->map->count; ++i) {
+		input_set_capability(buttons->idev, EV_KEY,
+				     buttons->map->buttons[i].keycode);
+	}
+
+	/*handler for touchscreen input device */
+	buttons->handler = kzalloc(sizeof(*buttons->handler), GFP_KERNEL);
+
+	buttons->handler->event = touchscreen_buttons_input_event;
+	buttons->handler->connect = touchscreen_buttons_input_connect;
+	buttons->handler->disconnect = touchscreen_buttons_input_disconnect;
+	buttons->handler->name = "touchscreen-buttons";
+	buttons->handler->id_table = touchscreen_buttons_ids;
+	buttons->handler->private = buttons;
+
+	error = input_register_handler(buttons->handler);
+	if (error) {
+		dev_err(&pdev->dev, "Input handler register failed: %d\n",
+			error);
+		return error;
+	}
+
+	error = input_register_device(buttons->idev);
+	if (error) {
+		dev_err(&pdev->dev, "Input device register failed: %d\n",
+			error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int touchscreen_buttons_remove(struct platform_device *pdev)
+{
+	struct touchscreen_buttons *buttons;
+
+	buttons = dev_get_drvdata(&pdev->dev);
+
+	input_unregister_handler(buttons->handler);
+	if (buttons->ts_handle) {
+		if (buttons->ts_handle->open != 0) {
+			input_close_device(buttons->ts_handle);
+		}
+		input_unregister_handle(buttons->ts_handle);
+	}
+
+	input_unregister_device(buttons->idev);
+
+	if (buttons->ts_handle)
+		kfree(buttons->ts_handle);
+
+	if (buttons->map) {
+		if (buttons->map->buttons)
+			kfree(buttons->map->buttons);
+		kfree(buttons->map);
+	}
+	kfree(buttons->handler);
+	kfree(buttons);
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id touchscreen_buttons_dt_match_table[] = {
+	{.compatible = "touchscreen-buttons"},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, touchscreen_buttons_dt_match_table);
+#endif
+
+static struct platform_driver touchscreen_buttons_driver = {
+	.probe = touchscreen_buttons_probe,
+	.remove = touchscreen_buttons_remove,
+	.driver = {
+		   .name = "touchscreen-buttons",
+		   .of_match_table =
+		   of_match_ptr(touchscreen_buttons_dt_match_table),
+		   },
+};
+
+module_platform_driver(touchscreen_buttons_driver);
+
+MODULE_ALIAS("platform:touchscreen-buttons");
+MODULE_DESCRIPTION("touchscreen-buttons");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Carl Klemm <carl@uvos.xyz>");
diff --git a/include/linux/input/touchscreen-buttons.h b/include/linux/input/touchscreen-buttons.h
new file mode 100644
index 000000000000..1b2254254cd9
--- /dev/null
+++ b/include/linux/input/touchscreen-buttons.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020 Carl Klemm <carl@uvos.xyz>
+ */
+
+#ifndef _TOUCHSCREEN_BUTTONS_H
+#define _TOUCHSCREEN_BUTTONS_H
+
+#include <linux/types.h>
+
+struct touchscreen_button {
+	__u32 x;
+	__u32 y;
+	__u32 width;
+	__u32 height;
+	__u32 keycode;
+	__u8  depressed;
+};
+
+struct touchscreen_button_map {
+	struct touchscreen_button *buttons;
+	__u32 count;
+	struct device *ts_dev;
+};
+
+#endif


-- 
Dev Null <devnull@uvos.xyz>
