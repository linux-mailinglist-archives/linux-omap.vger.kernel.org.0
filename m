Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3FF020B0FB
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 13:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbgFZLxr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 07:53:47 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:54469 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727818AbgFZLxp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Jun 2020 07:53:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id omv4jNJEP0MRaomvNjN2o7; Fri, 26 Jun 2020 13:53:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593172421; bh=8oN5h/IcMjieBGZRXooHSe63quNrRDFhFiqruOYVhFc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=RiT8FiKaprVNvf/9mLh8z3B+d91ZcwF9KoPSJNQLAlEx9nVZ9DLL0yIarlXr301JC
         uqmjI/et9GJW0HSbeT65jN1xNF/7jyKLBNfRKD4vzq0QkeGfy7dIsml4gQAGzNjzlw
         gehusC4P20KWG7LpZg37Zn0ilwwdIpnvjEnCaeXn6BL+wZ5MS4tkPOwOuZW/9eBubS
         xH40i8I8eLISPMbzHkWnQtvY3Icdj5ARwTydPiwoTNN0x9GQF0q9ohK6xBdMu9Tu9j
         M9hgz6j1ymLWOe/fScnrGQJHdZoKTKIiiDpTTsbpZLH4i/yn+kQ21VPvGBK7rMyp7d
         xeA6yYPAZJw/w==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 7/7] soc_camera.h: remove this unused header
Date:   Fri, 26 Jun 2020 13:53:21 +0200
Message-Id: <20200626115321.1898798-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJcySnIb1TKKUVygAr423rzmK0GVXc1ClLCc/4ucRl8sm2unSqng1YaqMIkumOh4drWUoy0eYEWk+0fuH5NkPU5tTGifj7u5pcg5QNPsu22Fy4akG6fu
 PsnJQMDKD+GrXkqoQLF4OYggfdLLXEN4UW49gqFjxZisY3UfP3so8DFAfInfwm4dHs1csRRxLEa2bcLXvVjG/YnL4TIZqPM4JCkc1mLjPGE+UBH7Ii/Zpw/z
 bi18T5CiPDG58fhLswmP14bsAWEuUY30sVvXfpE//JsKPlhWFxXZ0xufa9RaORW0WMfdVF+FnmmlsWBav1qnqxo0bJsWJJI6FJBKaKfhhIQ=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The soc_camera driver has been removed and all board files
that used it have been fixed. This header can now be removed
altogether.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 include/media/soc_camera.h | 397 -------------------------------------
 1 file changed, 397 deletions(-)
 delete mode 100644 include/media/soc_camera.h

diff --git a/include/media/soc_camera.h b/include/media/soc_camera.h
deleted file mode 100644
index 331c343a5b5a..000000000000
--- a/include/media/soc_camera.h
+++ /dev/null
@@ -1,397 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * camera image capture (abstract) bus driver header
- *
- * Copyright (C) 2006, Sascha Hauer, Pengutronix
- * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
- */
-
-#ifndef SOC_CAMERA_H
-#define SOC_CAMERA_H
-
-#include <linux/bitops.h>
-#include <linux/device.h>
-#include <linux/mutex.h>
-#include <linux/pm.h>
-#include <linux/videodev2.h>
-#include <media/videobuf2-v4l2.h>
-#include <media/v4l2-async.h>
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
-
-struct file;
-struct soc_camera_desc;
-struct soc_camera_async_client;
-
-struct soc_camera_device {
-	struct list_head list;		/* list of all registered devices */
-	struct soc_camera_desc *sdesc;
-	struct device *pdev;		/* Platform device */
-	struct device *parent;		/* Camera host device */
-	struct device *control;		/* E.g., the i2c client */
-	s32 user_width;
-	s32 user_height;
-	u32 bytesperline;		/* for padding, zero if unused */
-	u32 sizeimage;
-	enum v4l2_colorspace colorspace;
-	unsigned char iface;		/* Host number */
-	unsigned char devnum;		/* Device number per host */
-	struct soc_camera_sense *sense;	/* See comment in struct definition */
-	struct video_device *vdev;
-	struct v4l2_ctrl_handler ctrl_handler;
-	const struct soc_camera_format_xlate *current_fmt;
-	struct soc_camera_format_xlate *user_formats;
-	int num_user_formats;
-	enum v4l2_field field;		/* Preserve field over close() */
-	void *host_priv;		/* Per-device host private data */
-	/* soc_camera.c private count. Only accessed with .host_lock held */
-	int use_count;
-	struct file *streamer;		/* stream owner */
-	struct v4l2_clk *clk;
-	/* Asynchronous subdevice management */
-	struct soc_camera_async_client *sasc;
-	/* video buffer queue */
-	struct vb2_queue vb2_vidq;
-};
-
-/* Host supports programmable stride */
-#define SOCAM_HOST_CAP_STRIDE		(1 << 0)
-
-enum soc_camera_subdev_role {
-	SOCAM_SUBDEV_DATA_SOURCE = 1,
-	SOCAM_SUBDEV_DATA_SINK,
-	SOCAM_SUBDEV_DATA_PROCESSOR,
-};
-
-struct soc_camera_async_subdev {
-	struct v4l2_async_subdev asd;
-	enum soc_camera_subdev_role role;
-};
-
-struct soc_camera_host {
-	struct v4l2_device v4l2_dev;
-	struct list_head list;
-	struct mutex host_lock;		/* Main synchronisation lock */
-	struct mutex clk_lock;		/* Protect pipeline modifications */
-	unsigned char nr;		/* Host number */
-	u32 capabilities;
-	struct soc_camera_device *icd;	/* Currently attached client */
-	void *priv;
-	const char *drv_name;
-	struct soc_camera_host_ops *ops;
-	struct v4l2_async_subdev **asd;	/* Flat array, arranged in groups */
-	unsigned int *asd_sizes;	/* 0-terminated array of asd group sizes */
-};
-
-struct soc_camera_host_ops {
-	struct module *owner;
-	int (*add)(struct soc_camera_device *);
-	void (*remove)(struct soc_camera_device *);
-	int (*clock_start)(struct soc_camera_host *);
-	void (*clock_stop)(struct soc_camera_host *);
-	/*
-	 * .get_formats() is called for each client device format, but
-	 * .put_formats() is only called once. Further, if any of the calls to
-	 * .get_formats() fail, .put_formats() will not be called at all, the
-	 * failing .get_formats() must then clean up internally.
-	 */
-	int (*get_formats)(struct soc_camera_device *, unsigned int,
-			   struct soc_camera_format_xlate *);
-	void (*put_formats)(struct soc_camera_device *);
-	int (*get_selection)(struct soc_camera_device *, struct v4l2_selection *);
-	int (*set_selection)(struct soc_camera_device *, struct v4l2_selection *);
-	/*
-	 * The difference to .set_selection() is, that .set_liveselection is not allowed
-	 * to change the output sizes
-	 */
-	int (*set_liveselection)(struct soc_camera_device *, struct v4l2_selection *);
-	int (*set_fmt)(struct soc_camera_device *, struct v4l2_format *);
-	int (*try_fmt)(struct soc_camera_device *, struct v4l2_format *);
-	int (*init_videobuf2)(struct vb2_queue *,
-			      struct soc_camera_device *);
-	int (*querycap)(struct soc_camera_host *, struct v4l2_capability *);
-	int (*set_bus_param)(struct soc_camera_device *);
-	int (*get_parm)(struct soc_camera_device *, struct v4l2_streamparm *);
-	int (*set_parm)(struct soc_camera_device *, struct v4l2_streamparm *);
-	int (*enum_framesizes)(struct soc_camera_device *, struct v4l2_frmsizeenum *);
-	__poll_t (*poll)(struct file *, poll_table *);
-};
-
-#define SOCAM_SENSOR_INVERT_PCLK	(1 << 0)
-#define SOCAM_SENSOR_INVERT_MCLK	(1 << 1)
-#define SOCAM_SENSOR_INVERT_HSYNC	(1 << 2)
-#define SOCAM_SENSOR_INVERT_VSYNC	(1 << 3)
-#define SOCAM_SENSOR_INVERT_DATA	(1 << 4)
-
-struct i2c_board_info;
-struct regulator_bulk_data;
-
-struct soc_camera_subdev_desc {
-	/* Per camera SOCAM_SENSOR_* bus flags */
-	unsigned long flags;
-
-	/* sensor driver private platform data */
-	void *drv_priv;
-
-	/*
-	 * Set unbalanced_power to true to deal with legacy drivers, failing to
-	 * balance their calls to subdevice's .s_power() method. clock_state is
-	 * then used internally by helper functions, it shouldn't be touched by
-	 * drivers or the platform code.
-	 */
-	bool unbalanced_power;
-	unsigned long clock_state;
-
-	/* Optional callbacks to power on or off and reset the sensor */
-	int (*power)(struct device *, int);
-	int (*reset)(struct device *);
-
-	/*
-	 * some platforms may support different data widths than the sensors
-	 * native ones due to different data line routing. Let the board code
-	 * overwrite the width flags.
-	 */
-	int (*set_bus_param)(struct soc_camera_subdev_desc *, unsigned long flags);
-	unsigned long (*query_bus_param)(struct soc_camera_subdev_desc *);
-	void (*free_bus)(struct soc_camera_subdev_desc *);
-
-	/* Optional regulators that have to be managed on power on/off events */
-	struct v4l2_subdev_platform_data sd_pdata;
-};
-
-struct soc_camera_host_desc {
-	/* Camera bus id, used to match a camera and a bus */
-	int bus_id;
-	int i2c_adapter_id;
-	struct i2c_board_info *board_info;
-	const char *module_name;
-
-	/*
-	 * For non-I2C devices platform has to provide methods to add a device
-	 * to the system and to remove it
-	 */
-	int (*add_device)(struct soc_camera_device *);
-	void (*del_device)(struct soc_camera_device *);
-};
-
-/*
- * Platform data for "soc-camera-pdrv"
- * This MUST be kept binary-identical to struct soc_camera_link below, until
- * it is completely replaced by this one, after which we can split it into its
- * two components.
- */
-struct soc_camera_desc {
-	struct soc_camera_subdev_desc subdev_desc;
-	struct soc_camera_host_desc host_desc;
-};
-
-/* Prepare to replace this struct: don't change its layout any more! */
-struct soc_camera_link {
-	/*
-	 * Subdevice part - keep at top and compatible to
-	 * struct soc_camera_subdev_desc
-	 */
-
-	/* Per camera SOCAM_SENSOR_* bus flags */
-	unsigned long flags;
-
-	void *priv;
-
-	/* Set by platforms to handle misbehaving drivers */
-	bool unbalanced_power;
-	/* Used by soc-camera helper functions */
-	unsigned long clock_state;
-
-	/* Optional callbacks to power on or off and reset the sensor */
-	int (*power)(struct device *, int);
-	int (*reset)(struct device *);
-	/*
-	 * some platforms may support different data widths than the sensors
-	 * native ones due to different data line routing. Let the board code
-	 * overwrite the width flags.
-	 */
-	int (*set_bus_param)(struct soc_camera_link *, unsigned long flags);
-	unsigned long (*query_bus_param)(struct soc_camera_link *);
-	void (*free_bus)(struct soc_camera_link *);
-
-	/* Optional regulators that have to be managed on power on/off events */
-	struct regulator_bulk_data *regulators;
-	int num_regulators;
-
-	void *host_priv;
-
-	/*
-	 * Host part - keep at bottom and compatible to
-	 * struct soc_camera_host_desc
-	 */
-
-	/* Camera bus id, used to match a camera and a bus */
-	int bus_id;
-	int i2c_adapter_id;
-	struct i2c_board_info *board_info;
-	const char *module_name;
-
-	/*
-	 * For non-I2C devices platform has to provide methods to add a device
-	 * to the system and to remove it
-	 */
-	int (*add_device)(struct soc_camera_device *);
-	void (*del_device)(struct soc_camera_device *);
-};
-
-static inline struct soc_camera_host *to_soc_camera_host(
-	const struct device *dev)
-{
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
-
-	return container_of(v4l2_dev, struct soc_camera_host, v4l2_dev);
-}
-
-static inline struct soc_camera_desc *to_soc_camera_desc(
-	const struct soc_camera_device *icd)
-{
-	return icd->sdesc;
-}
-
-static inline struct device *to_soc_camera_control(
-	const struct soc_camera_device *icd)
-{
-	return icd->control;
-}
-
-static inline struct v4l2_subdev *soc_camera_to_subdev(
-	const struct soc_camera_device *icd)
-{
-	struct device *control = to_soc_camera_control(icd);
-	return dev_get_drvdata(control);
-}
-
-int soc_camera_host_register(struct soc_camera_host *ici);
-void soc_camera_host_unregister(struct soc_camera_host *ici);
-
-const struct soc_camera_format_xlate *soc_camera_xlate_by_fourcc(
-	struct soc_camera_device *icd, unsigned int fourcc);
-
-/**
- * struct soc_camera_format_xlate - match between host and sensor formats
- * @code: code of a sensor provided format
- * @host_fmt: host format after host translation from code
- *
- * Host and sensor translation structure. Used in table of host and sensor
- * formats matchings in soc_camera_device. A host can override the generic list
- * generation by implementing get_formats(), and use it for format checks and
- * format setup.
- */
-struct soc_camera_format_xlate {
-	u32 code;
-	const struct soc_mbus_pixelfmt *host_fmt;
-};
-
-#define SOCAM_SENSE_PCLK_CHANGED	(1 << 0)
-
-/**
- * This struct can be attached to struct soc_camera_device by the host driver
- * to request sense from the camera, for example, when calling .set_fmt(). The
- * host then can check which flags are set and verify respective values if any.
- * For example, if SOCAM_SENSE_PCLK_CHANGED is set, it means, pixclock has
- * changed during this operation. After completion the host should detach sense.
- *
- * @flags		ored SOCAM_SENSE_* flags
- * @master_clock	if the host wants to be informed about pixel-clock
- *			change, it better set master_clock.
- * @pixel_clock_max	maximum pixel clock frequency supported by the host,
- *			camera is not allowed to exceed this.
- * @pixel_clock		if the camera driver changed pixel clock during this
- *			operation, it sets SOCAM_SENSE_PCLK_CHANGED, uses
- *			master_clock to calculate the new pixel-clock and
- *			sets this field.
- */
-struct soc_camera_sense {
-	unsigned long flags;
-	unsigned long master_clock;
-	unsigned long pixel_clock_max;
-	unsigned long pixel_clock;
-};
-
-#define SOCAM_DATAWIDTH(x)	BIT((x) - 1)
-#define SOCAM_DATAWIDTH_4	SOCAM_DATAWIDTH(4)
-#define SOCAM_DATAWIDTH_8	SOCAM_DATAWIDTH(8)
-#define SOCAM_DATAWIDTH_9	SOCAM_DATAWIDTH(9)
-#define SOCAM_DATAWIDTH_10	SOCAM_DATAWIDTH(10)
-#define SOCAM_DATAWIDTH_12	SOCAM_DATAWIDTH(12)
-#define SOCAM_DATAWIDTH_15	SOCAM_DATAWIDTH(15)
-#define SOCAM_DATAWIDTH_16	SOCAM_DATAWIDTH(16)
-#define SOCAM_DATAWIDTH_18	SOCAM_DATAWIDTH(18)
-#define SOCAM_DATAWIDTH_24	SOCAM_DATAWIDTH(24)
-
-#define SOCAM_DATAWIDTH_MASK (SOCAM_DATAWIDTH_4 | SOCAM_DATAWIDTH_8 | \
-			      SOCAM_DATAWIDTH_9 | SOCAM_DATAWIDTH_10 | \
-			      SOCAM_DATAWIDTH_12 | SOCAM_DATAWIDTH_15 | \
-			      SOCAM_DATAWIDTH_16 | SOCAM_DATAWIDTH_18 | \
-			      SOCAM_DATAWIDTH_24)
-
-static inline void soc_camera_limit_side(int *start, int *length,
-		unsigned int start_min,
-		unsigned int length_min, unsigned int length_max)
-{
-	if (*length < length_min)
-		*length = length_min;
-	else if (*length > length_max)
-		*length = length_max;
-
-	if (*start < start_min)
-		*start = start_min;
-	else if (*start > start_min + length_max - *length)
-		*start = start_min + length_max - *length;
-}
-
-unsigned long soc_camera_apply_board_flags(struct soc_camera_subdev_desc *ssdd,
-					   const struct v4l2_mbus_config *cfg);
-
-int soc_camera_power_init(struct device *dev, struct soc_camera_subdev_desc *ssdd);
-int soc_camera_power_on(struct device *dev, struct soc_camera_subdev_desc *ssdd,
-			struct v4l2_clk *clk);
-int soc_camera_power_off(struct device *dev, struct soc_camera_subdev_desc *ssdd,
-			 struct v4l2_clk *clk);
-
-static inline int soc_camera_set_power(struct device *dev,
-		struct soc_camera_subdev_desc *ssdd, struct v4l2_clk *clk, bool on)
-{
-	return on ? soc_camera_power_on(dev, ssdd, clk)
-		  : soc_camera_power_off(dev, ssdd, clk);
-}
-
-/* This is only temporary here - until v4l2-subdev begins to link to video_device */
-#include <linux/i2c.h>
-static inline struct video_device *soc_camera_i2c_to_vdev(const struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct soc_camera_device *icd = v4l2_get_subdev_hostdata(sd);
-	return icd ? icd->vdev : NULL;
-}
-
-static inline struct soc_camera_subdev_desc *soc_camera_i2c_to_desc(const struct i2c_client *client)
-{
-	return client->dev.platform_data;
-}
-
-static inline struct v4l2_subdev *soc_camera_vdev_to_subdev(struct video_device *vdev)
-{
-	struct soc_camera_device *icd = video_get_drvdata(vdev);
-	return soc_camera_to_subdev(icd);
-}
-
-static inline struct soc_camera_device *soc_camera_from_vb2q(const struct vb2_queue *vq)
-{
-	return container_of(vq, struct soc_camera_device, vb2_vidq);
-}
-
-static inline u32 soc_camera_grp_id(const struct soc_camera_device *icd)
-{
-	return (icd->iface << 8) | (icd->devnum + 1);
-}
-
-void soc_camera_lock(struct vb2_queue *vq);
-void soc_camera_unlock(struct vb2_queue *vq);
-
-#endif
-- 
2.27.0

