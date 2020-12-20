Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB1A2DF710
	for <lists+linux-omap@lfdr.de>; Sun, 20 Dec 2020 23:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbgLTWtD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 20 Dec 2020 17:49:03 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:43308 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgLTWtC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 20 Dec 2020 17:49:02 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 95ED91C0B79; Sun, 20 Dec 2020 23:48:16 +0100 (CET)
Date:   Sun, 20 Dec 2020 23:48:16 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Johan Hovold <johan@kernel.org>, phone-devel@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv6 0/4] n_gsm serdev support and protocol driver for
 droid4 modem
Message-ID: <20201220224816.GA28213@duo.ucw.cz>
References: <20200421232752.3070-1-tony@atomide.com>
 <20200423114326.GQ18608@localhost>
 <20200423153756.GE37466@atomide.com>
 <20200528082420.GA10358@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <20200528082420.GA10358@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Sorry about the late reply on this.

I'm afraid I'll need some more answers in near future, but for now:

Tony, do you remember / can you figure out what gsmtty GPS is on? I
never used it on that interface, and I can't seem to figure it out.

My notes say:

/dev/motmdm1 -- basic support, calls, on/off                               =
    =20
/dev/motmdm3 -- send sms interface                                         =
    =20
/dev/motmdm9 -- receive sms interface                                      =
    =20

(and gsmtty numbering is same)

For now I converted gnss driver to use serdev interface, and n_gsm to
provide it... Not yet finished but I believe I'm walking in the right
direction.

Best regards,
								Pavel

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boo=
t/dts/motorola-mapphone-common.dtsi
index f5e7ec8e1028..ce907aa40a28 100644
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -761,9 +761,22 @@
 		};
=20
 		gnss@4 {
-			compatible =3D "motorola,mapphone-mdm6600-gnss";
+			compatible =3D "disabled-old,motorola,mapphone-mdm6600-gnss";
 			reg =3D <4>;
 		};
+
+		port@1 {
+			compatible =3D "gsmmux,port";
+			reg =3D <1>;
+			subdev@1 {
+				 compatible =3D "motorola,mapphone-mdm6600-gnss";
+			};
+		};
+
+		port@3 {
+			compatible =3D "disabled,gsmmux,port";
+			reg =3D <3>;
+		};
 	};
 };
=20
diff --git a/drivers/gnss/motmdm.c b/drivers/gnss/motmdm.c
index da1d44bed899..5a74bbcbc5de 100644
--- a/drivers/gnss/motmdm.c
+++ b/drivers/gnss/motmdm.c
@@ -3,11 +3,14 @@
  * Motorola Modem TS 27.010 serdev GNSS driver
  *
  * Copyright (C) 2018 - 2020 Tony Lindgren <tony@atomide.com>
+ * Copyright (C) 2020 Pavel Machek <pavel@ucw.cz>
  *
  * Based on drivers/gnss/sirf.c driver example:
  * Copyright (C) 2018 Johan Hovold <johan@kernel.org>
  */
=20
+/* FIXME: see serial.c for good example..? */
+
 #include <linux/errno.h>
 #include <linux/gnss.h>
 #include <linux/init.h>
@@ -45,7 +48,7 @@ enum motmdm_gnss_status {
 struct motmdm_gnss_data {
 	struct gnss_device *gdev;
 	struct device *modem;
-	struct gsm_serdev_dlci dlci;
+	struct serdev_device *serdev;
 	struct delayed_work restart_work;
 	struct mutex mutex;	/* For modem commands */
 	ktime_t last_update;
@@ -76,6 +79,7 @@ int motmdm_gnss_send_command(struct motmdm_gnss_data *dda=
ta,
 	unsigned char cmd[128];
 	int ret, cmdlen;
=20
+	printk("send_command\n");
 	cmdlen =3D len + 5 + 1;
 	if (cmdlen > 128)
 		return -EINVAL;
@@ -84,23 +88,31 @@ int motmdm_gnss_send_command(struct motmdm_gnss_data *d=
data,
 	memset(ddata->buf, 0, ddata->len);
 	ddata->parsed =3D false;
 	snprintf(cmd, cmdlen, "U%04li%s", jiffies % 10000, buf);
-	ret =3D serdev_ngsm_write(ddata->modem, &ddata->dlci, cmd, cmdlen);
+	printk("serdev_write\n");
+=09
+	ret =3D serdev_device_write(ddata->serdev, cmd, cmdlen, MAX_SCHEDULE_TIME=
OUT);
 	if (ret < 0)
 		goto out_unlock;
=20
+	printk("wait event\n");
 	ret =3D wait_event_timeout(ddata->read_queue, ddata->parsed,
 				 msecs_to_jiffies(timeout_ms));
 	if (ret =3D=3D 0) {
 		ret =3D -ETIMEDOUT;
+		printk("...timeout FIXME\n");
+		ret =3D 0;
 		goto out_unlock;
 	} else if (ret < 0) {
+		printk("...error FIXME\n");
+		ret =3D 0;
 		goto out_unlock;
 	}
=20
 	if (!strstr(ddata->buf, ":OK")) {
 		dev_err(&gdev->dev, "command %s error %s\n",
 			cmd, ddata->buf);
-		ret =3D -EPIPE;
+		printk("did not get ok\n");
+		//ret =3D -EPIPE;
 	}
=20
 	ret =3D len;
@@ -198,7 +210,7 @@ static int motmdm_gnss_finish(struct gnss_device *gdev)
 	return motmdm_gnss_send_command(ddata, cmd, strlen(cmd));
 }
=20
-static int motmdm_gnss_receive_data(struct gsm_serdev_dlci *dlci,
+static int motmdm_gnss_receive_data(struct gsm_serdev_dlci_operations *dlc=
i,
 				    const unsigned char *buf,
 				    size_t len)
 {
@@ -208,6 +220,8 @@ static int motmdm_gnss_receive_data(struct gsm_serdev_d=
lci *dlci,
 	size_t msglen;
 	int error =3D 0;
=20
+	printk("motmdm_gnss_receive_data\n");
+
 	if (len <=3D MOTMDM_GNSS_RESP_LEN)
 		return 0;
=20
@@ -283,19 +297,21 @@ static int motmdm_gnss_receive_data(struct gsm_serdev=
_dlci *dlci,
 static int motmdm_gnss_open(struct gnss_device *gdev)
 {
 	struct motmdm_gnss_data *ddata =3D gnss_get_drvdata(gdev);
-	struct gsm_serdev_dlci *dlci =3D &ddata->dlci;
+//	struct gsm_serdev_dlci_operations *dlci =3D &ddata->dlci;
 	int error;
=20
+#if 0
 	dlci->drvdata =3D gdev;
 	dlci->receive_buf =3D motmdm_gnss_receive_data;
=20
 	error =3D serdev_ngsm_register_dlci(ddata->modem, dlci);
 	if (error)
 		return error;
+#endif
=20
 	error =3D motmdm_gnss_init(gdev);
 	if (error) {
-		serdev_ngsm_unregister_dlci(ddata->modem, dlci);
+//		serdev_ngsm_unregister_dlci(ddata->modem, dlci);
=20
 		return error;
 	}
@@ -306,9 +322,10 @@ static int motmdm_gnss_open(struct gnss_device *gdev)
 static void motmdm_gnss_close(struct gnss_device *gdev)
 {
 	struct motmdm_gnss_data *ddata =3D gnss_get_drvdata(gdev);
-	struct gsm_serdev_dlci *dlci =3D &ddata->dlci;
+//	struct gsm_serdev_dlci_operations *dlci =3D &ddata->dlci;
 	int error;
=20
+#if 0
 	dlci->receive_buf =3D NULL;
 	error =3D motmdm_gnss_finish(gdev);
 	if (error < 0)
@@ -316,15 +333,18 @@ static void motmdm_gnss_close(struct gnss_device *gde=
v)
 			 __func__, error);
=20
 	serdev_ngsm_unregister_dlci(ddata->modem, dlci);
+#endif
 }
=20
 static int motmdm_gnss_write_raw(struct gnss_device *gdev,
 				 const unsigned char *buf,
 				 size_t count)
 {
+#if 0
 	struct motmdm_gnss_data *ddata =3D gnss_get_drvdata(gdev);
=20
 	return serdev_ngsm_write(ddata->modem, &ddata->dlci, buf, count);
+#endif
 }
=20
 static const struct gnss_operations motmdm_gnss_ops =3D {
@@ -333,26 +353,78 @@ static const struct gnss_operations motmdm_gnss_ops =
=3D {
 	.write_raw	=3D motmdm_gnss_write_raw,
 };
=20
-static int motmdm_gnss_probe(struct platform_device *pdev)
+static int gnss_serial_receive_buf(struct serdev_device *serdev,
+                                        const unsigned char *buf, size_t c=
ount)
+{
+	struct motmdm_gnss_data *ddata =3D serdev_device_get_drvdata(serdev);
+	struct gnss_device *gdev =3D ddata->gdev;
+=09
+	printk("gnss_serial_recieve: %d bytes\n", count);
+	printk("gnss_serial_recieve: have data: %s bytes\n", buf);
+
+	return gnss_insert_raw(gdev, buf, count);
+}
+
+static const struct serdev_device_ops gnss_serial_serdev_ops =3D {
+        .receive_buf    =3D gnss_serial_receive_buf,
+        .write_wakeup   =3D serdev_device_write_wakeup,
+};
+
+
+int motmdm_gnss_test(struct serdev_device *serdev)
 {
-	struct device *dev =3D &pdev->dev;
+	int ret;
+	if (!serdev)
+		return -EIO;
+	printk("have serdev_device: %p, nr %d\n", serdev, serdev->nr);
+
+	dev_info(&serdev->dev, "interesting line, testing\n");
+=09
+	/* HERE */
+        serdev_device_set_client_ops(serdev, &gnss_serial_serdev_ops);
+
+	dev_info(&serdev->dev, "opening serdev\n");
+	ret =3D serdev_device_open(serdev);
+        if (ret) {
+                return ret;
+	}
+
+//        serdev_device_set_baudrate(serdev, gserial->speed);
+//        serdev_device_set_flow_control(serdev, false);
+	dev_info(&serdev->dev, "writing\n");
+=09
+	{
+		int count =3D 5;
+		ret =3D serdev_device_write(serdev, "HELLO", count, MAX_SCHEDULE_TIMEOUT=
);
+		if (ret < 0 || ret < count)
+			return ret;
+	}
+	dev_info(&serdev->dev, "waiting\n");
+=09
+        serdev_device_wait_until_sent(serdev, 0);
+	dev_info(&serdev->dev, "all ok\n");
+=09
+	return 0;
+}
+
+static int motmdm_gnss_probe(struct serdev_device *serdev)
+{
+	struct device *dev =3D &serdev->dev;
 	struct motmdm_gnss_data *ddata;
 	struct gnss_device *gdev;
 	u32 line;
 	int ret;
=20
+	printk("gnss_probe\n");
+
 	ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;
=20
-	ret =3D of_property_read_u32(dev->of_node, "reg", &line);
-	if (ret)
-		return ret;
-
-	if (!line)
-		return -EINVAL;
+	printk("gnss_probe: searching for reg\n");
+	motmdm_gnss_test(serdev);
=20
-	ddata->dlci.line =3D line;
+	ddata->serdev =3D serdev;
 	ddata->modem =3D dev->parent;
 	ddata->len =3D PAGE_SIZE;
 	mutex_init(&ddata->mutex);
@@ -363,7 +435,7 @@ static int motmdm_gnss_probe(struct platform_device *pd=
ev)
 	if (!ddata->buf)
 		return -ENOMEM;
=20
-	platform_set_drvdata(pdev, ddata);
+	serdev_device_set_drvdata(serdev, ddata);
=20
 	gdev =3D gnss_allocate_device(dev);
 	if (!gdev)
@@ -386,14 +458,12 @@ static int motmdm_gnss_probe(struct platform_device *=
pdev)
 	return ret;
 }
=20
-static int motmdm_gnss_remove(struct platform_device *pdev)
+static void motmdm_gnss_remove(struct serdev_device *serdev)
 {
-	struct motmdm_gnss_data *data =3D platform_get_drvdata(pdev);
+	struct motmdm_gnss_data *data =3D serdev_device_get_drvdata(serdev);
=20
 	gnss_deregister_device(data->gdev);
 	gnss_put_device(data->gdev);
-
-	return 0;
 };
=20
 #ifdef CONFIG_OF
@@ -404,7 +474,7 @@ static const struct of_device_id motmdm_gnss_of_match[]=
 =3D {
 MODULE_DEVICE_TABLE(of, motmdm_gnss_of_match);
 #endif
=20
-static struct platform_driver motmdm_gnss_driver =3D {
+static struct serdev_device_driver motmdm_gnss_driver =3D {
 	.driver	=3D {
 		.name		=3D "gnss-mot-mdm6600",
 		.of_match_table	=3D of_match_ptr(motmdm_gnss_of_match),
@@ -412,7 +482,7 @@ static struct platform_driver motmdm_gnss_driver =3D {
 	.probe	=3D motmdm_gnss_probe,
 	.remove	=3D motmdm_gnss_remove,
 };
-module_platform_driver(motmdm_gnss_driver);
+module_serdev_device_driver(motmdm_gnss_driver);
=20
 MODULE_AUTHOR("Tony Lindgren <tony@atomide.com>");
 MODULE_DESCRIPTION("Motorola Mapphone MDM6600 GNSS receiver driver");
diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
index 460123447fa1..00a5c8225973 100644
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -52,14 +52,17 @@
 #include <linux/etherdevice.h>
 #include <linux/gsmmux.h>
 #include <linux/serdev-gsm.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
=20
 static int debug;
 module_param(debug, int, 0600);
=20
 /* Defaults: these are from the specification */
=20
-#define T1	10		/* 100mS */
-#define T2	34		/* 333mS */
+#define T1	10		/* 100ms */
+#define T2	34		/* 333ms */
 #define N2	3		/* Retry 3 times */
=20
 /* Use long timers for testing at low speed with debug on */
@@ -152,7 +155,7 @@ struct gsm_dlci {
 	/* Data handling callback */
 	void (*data)(struct gsm_dlci *dlci, const u8 *data, int len);
 	void (*prev_data)(struct gsm_dlci *dlci, const u8 *data, int len);
-	struct gsm_serdev_dlci *ops; /* serdev dlci ops, if used */
+	struct gsm_serdev_dlci_operations *ops; /* serdev dlci ops, if used */
 	struct net_device *net; /* network interface, if created */
 };
=20
@@ -591,7 +594,8 @@ static void gsm_send(struct gsm_mux *gsm, int addr, int=
 cr, int control)
 		WARN_ON(1);
 		return;
 	}
-	gsm->output(gsm, cbuf, len);
+	if (gsm->output)
+		gsm->output(gsm, cbuf, len);
 	gsm_print_packet("-->", addr, cr, control, NULL, 0);
 }
=20
@@ -691,7 +695,7 @@ static void gsm_data_kick(struct gsm_mux *gsm, struct g=
sm_dlci *dlci)
 			print_hex_dump_bytes("gsm_data_kick: ",
 					     DUMP_PREFIX_OFFSET,
 					     gsm->txframe, len);
-		if (gsm->output(gsm, gsm->txframe, len) < 0)
+		if (gsm->output && gsm->output(gsm, gsm->txframe, len) < 0)
 			break;
 		/* FIXME: Can eliminate one SOF in many more cases */
 		gsm->tx_bytes -=3D msg->len;
@@ -1019,7 +1023,7 @@ static void gsm_control_reply(struct gsm_mux *gsm, in=
t cmd, const u8 *data,
 static void gsm_process_modem(struct tty_struct *tty, struct gsm_dlci *dlc=
i,
 							u32 modem, int clen)
 {
-	int  mlines =3D 0;
+	int mlines =3D 0;
 	u8 brk =3D 0;
 	int fc;
=20
@@ -2344,38 +2348,11 @@ static int gsm_config(struct gsm_mux *gsm, struct g=
sm_config *c)
 }
=20
 #ifdef CONFIG_SERIAL_DEV_BUS
-
-/**
- * gsm_serdev_get_config - read ts 27.010 config
- * @gsd:	serdev-gsm instance
- * @c:		ts 27.010 config data
- *
- * See gsm_copy_config_values() for more information.
- */
-int gsm_serdev_get_config(struct gsm_serdev *gsd, struct gsm_config *c)
-{
-	struct gsm_mux *gsm;
-
-	if (!gsd || !gsd->gsm)
-		return -ENODEV;
-
-	gsm =3D gsd->gsm;
-
-	if (!c)
-		return -EINVAL;
-
-	gsm_copy_config_values(gsm, c);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(gsm_serdev_get_config);
-
+#if 1
 /**
  * gsm_serdev_set_config - set ts 27.010 config
  * @gsd:	serdev-gsm instance
  * @c:		ts 27.010 config data
- *
- * See gsm_config() for more information.
  */
 int gsm_serdev_set_config(struct gsm_serdev *gsd, struct gsm_config *c)
 {
@@ -2393,6 +2370,7 @@ int gsm_serdev_set_config(struct gsm_serdev *gsd, str=
uct gsm_config *c)
 }
 EXPORT_SYMBOL_GPL(gsm_serdev_set_config);
=20
+#endif
 static struct gsm_dlci *gsd_dlci_get(struct gsm_serdev *gsd, int line,
 				     bool allocate)
 {
@@ -2404,7 +2382,7 @@ static struct gsm_dlci *gsd_dlci_get(struct gsm_serde=
v *gsd, int line,
=20
 	gsm =3D gsd->gsm;
=20
-	if (line < 1 || line >=3D 63)
+	if (line < 1 || line >=3D 62)
 		return ERR_PTR(-EINVAL);
=20
 	mutex_lock(&gsm->mutex);
@@ -2431,7 +2409,8 @@ static struct gsm_dlci *gsd_dlci_get(struct gsm_serde=
v *gsd, int line,
 	return dlci;
 }
=20
-static int gsd_dlci_receive_buf(struct gsm_serdev_dlci *ops,
+#if 1
+static int gsd_dlci_receive_buf(struct gsm_serdev_dlci_operations *ops,
 				const unsigned char *buf,
 				size_t len)
 {
@@ -2449,6 +2428,7 @@ static int gsd_dlci_receive_buf(struct gsm_serdev_dlc=
i *ops,
=20
 	return len;
 }
+#endif
=20
 static void gsd_dlci_data(struct gsm_dlci *dlci, const u8 *buf, int len)
 {
@@ -2471,58 +2451,6 @@ static void gsd_dlci_data(struct gsm_dlci *dlci, con=
st u8 *buf, int len)
 	}
 }
=20
-/**
- * gsm_serdev_write - write data to a ts 27.010 channel
- * @gsd:	serdev-gsm instance
- * @ops:	channel ops
- * @buf:	write buffer
- * @len:	buffer length
- */
-int gsm_serdev_write(struct gsm_serdev *gsd, struct gsm_serdev_dlci *ops,
-		     const u8 *buf, int len)
-{
-	struct gsm_mux *gsm;
-	struct gsm_dlci *dlci;
-	struct gsm_msg *msg;
-	int h, size, total_size =3D 0;
-	u8 *dp;
-
-	if (!gsd || !gsd->gsm)
-		return -ENODEV;
-
-	gsm =3D gsd->gsm;
-
-	dlci =3D gsd_dlci_get(gsd, ops->line, false);
-	if (IS_ERR(dlci))
-		return PTR_ERR(dlci);
-
-	h =3D dlci->adaption - 1;
-
-	if (len > gsm->mtu)
-		len =3D gsm->mtu;
-
-	size =3D len + h;
-
-	msg =3D gsm_data_alloc(gsm, dlci->addr, size, gsm->ftype);
-	if (!msg)
-		return -ENOMEM;
-
-	dp =3D msg->data;
-	switch (dlci->adaption) {
-	case 1:
-		break;
-	case 2:
-		*dp++ =3D gsm_encode_modem(dlci);
-		break;
-	}
-	memcpy(dp, buf, len);
-	gsm_data_queue(dlci, msg);
-	total_size +=3D size;
-
-	return total_size;
-}
-EXPORT_SYMBOL_GPL(gsm_serdev_write);
-
 /**
  * gsm_serdev_data_kick - indicate more data can be transmitted
  * @gsd:	serdev-gsm instance
@@ -2545,13 +2473,14 @@ void gsm_serdev_data_kick(struct gsm_serdev *gsd)
 }
 EXPORT_SYMBOL_GPL(gsm_serdev_data_kick);
=20
+#if 1
 /**
  * gsm_serdev_register_dlci - register a ts 27.010 channel
  * @gsd:	serdev-gsm instance
  * @ops:	channel ops
  */
 int gsm_serdev_register_dlci(struct gsm_serdev *gsd,
-			     struct gsm_serdev_dlci *ops)
+			     struct gsm_serdev_dlci_operations *ops)
 {
 	struct gsm_dlci *dlci;
 	struct gsm_mux *gsm;
@@ -2578,7 +2507,7 @@ int gsm_serdev_register_dlci(struct gsm_serdev *gsd,
 	dlci->ops =3D ops;
 	dlci->modem_rx =3D 0;
 	dlci->prev_data =3D dlci->data;
-	dlci->data =3D gsd_dlci_data;
+	dlci->data =3D gsd_dlci_data; /* FIXME: do we want this? */
 	mutex_unlock(&dlci->mutex);
=20
 	gsm_dlci_begin_open(dlci);
@@ -2609,7 +2538,7 @@ EXPORT_SYMBOL_GPL(gsm_serdev_register_dlci);
  * @ops:	channel ops
  */
 void gsm_serdev_unregister_dlci(struct gsm_serdev *gsd,
-				struct gsm_serdev_dlci *ops)
+				struct gsm_serdev_dlci_operations *ops)
 {
 	struct gsm_mux *gsm;
 	struct gsm_dlci *dlci;
@@ -2636,6 +2565,7 @@ void gsm_serdev_unregister_dlci(struct gsm_serdev *gs=
d,
 	gsm_dlci_begin_close(dlci);
 }
 EXPORT_SYMBOL_GPL(gsm_serdev_unregister_dlci);
+#endif
=20
 static int gsm_serdev_output(struct gsm_mux *gsm, u8 *data, int len)
 {
@@ -2647,6 +2577,7 @@ static int gsm_serdev_output(struct gsm_mux *gsm, u8 =
*data, int len)
 		return serdev_device_write_buf(serdev, data, len);
 }
=20
+#if 1
 static int gsd_receive_buf(struct serdev_device *serdev, const u8 *data,
 			   size_t count)
 {
@@ -2680,13 +2611,18 @@ static struct serdev_device_ops gsd_client_ops =3D {
 	.receive_buf =3D gsd_receive_buf,
 	.write_wakeup =3D gsd_write_wakeup,
 };
+#endif
+
+extern int motmdm_gnss_attach(struct device *dev, int line);
=20
 int gsm_serdev_register_tty_port(struct gsm_serdev *gsd, int line)
 {
-	struct gsm_serdev_dlci *ops;
+	struct gsm_serdev_dlci_operations *ops;
 	unsigned int base;
 	int error;
-
+	struct device *dev;
+	struct device_node *node;
+	=09
 	if (line < 1)
 		return -EINVAL;
=20
@@ -2704,8 +2640,83 @@ int gsm_serdev_register_tty_port(struct gsm_serdev *=
gsd, int line)
 		return error;
 	}
=20
+
 	base =3D mux_num_to_base(gsd->gsm);
-	tty_register_device(gsm_tty_driver, base + ops->line, NULL);
+	printk("register_tty_port: have port: %p, %d+%d\n", &gsd->gsm->dlci[line]=
->port, base, ops->line);
+	dev =3D &gsd->serdev->dev;
+	if (line !=3D 1)
+		return 0;
+
+	for_each_available_child_of_node(dev->of_node, node) {
+		struct platform_device_info devinfo =3D {};
+		static int idx;
+		struct platform_device *pdev;
+		const char *c =3D of_get_property(node, "compatible", NULL);
+	=09
+		dev_info(dev, "register_tty: child -- %pOF\n", node);
+
+		if (!c)
+			continue;
+		dev_info(dev, "register_tty: child -- %pOF -- compatible %s\n", node, c);
+		if (strcmp(c, "gsmmux,port"))
+			continue;
+
+		printk("n_gsm: Have subnode with right compatible!\n");
+	=09
+		devinfo.name =3D kasprintf(GFP_KERNEL, "gsm-mux-%d", idx++);
+		devinfo.parent =3D dev;
+
+		/* Thanks to core.c: serdev_device_add */
+		pdev =3D platform_device_register_full(&devinfo);
+		pdev->dev.of_node =3D node;
+
+#if 0
+		tty_register_device(gsm_tty_driver, base + ops->line, NULL);
+#else
+		{
+			struct device *dev;
+
+			dev =3D tty_port_register_device_serdev(&gsd->gsm->dlci[line]->port, gs=
m_tty_driver, base + ops->line, &pdev->dev /* FIXME: needs non-null to atte=
mpt serdev registration */ );
+			printk("register_tty_port: got %p\n", dev);
+			{
+#if 0
+				struct serdev_controller *ctrl =3D to_serdev_controller(dev);
+				struct serdev_device *serdev =3D serdev_device_alloc(ctrl);
+				int err;
+				if (!serdev)
+					dev_err(dev, "could not alloc serdev, that is bad\n");
+
+				//serdev->dev.of_node =3D node;
+
+				err =3D serdev_device_add(serdev);
+				if (err) {
+					dev_err(&serdev->dev,
+						"failure adding device. status %pe\n",
+						ERR_PTR(err));
+					//serdev_device_put(serdev);
+				}
+#endif
+#if 0
+				printk("register_tty_port: Forcing attach\n");
+				/* FIXME: Need to do of_serdev_register_devices() ? */
+				motmdm_gnss_attach(dev, ops->line);
+#endif
+			}
+
+		}
+	}
+#endif
+	/* FIXME:
+
+extern struct device *tty_register_device(struct tty_driver *driver,
+                                          unsigned index, struct device *d=
ev);
+
+Would like tty_port_register_device_attr or better
+	   	       tty_port_register_device_attr_serdev=20
+
+ale chce navic struct tty_port *.
+
+		       _attr() -- last 2 arguments can be NULL. */
=20
 	return 0;
 }
@@ -2730,29 +2741,14 @@ void gsm_serdev_unregister_tty_port(struct gsm_serd=
ev *gsd, int line)
 }
 EXPORT_SYMBOL_GPL(gsm_serdev_unregister_tty_port);
=20
-struct gsm_serdev_dlci *
-gsm_serdev_tty_port_get_dlci(struct gsm_serdev *gsd, int line)
-{
-	struct gsm_dlci *dlci;
-
-	if (line < 1)
-		return NULL;
-
-	dlci =3D gsd_dlci_get(gsd, line, false);
-	if (IS_ERR(dlci))
-		return NULL;
-
-	return dlci->ops;
-}
-EXPORT_SYMBOL_GPL(gsm_serdev_tty_port_get_dlci);
-
+#if 1
 int gsm_serdev_register_device(struct gsm_serdev *gsd)
 {
 	struct gsm_mux *gsm;
 	int error;
=20
-	if (WARN(!gsd || !gsd->serdev || !gsd->output,
-		 "serdev and output must be initialized\n"))
+	if (WARN(!gsd || !gsd->serdev,
+		 "serdev must be initialized\n"))
 		return -EINVAL;
=20
 	serdev_device_set_client_ops(gsd->serdev, &gsd_client_ops);
@@ -2787,7 +2783,7 @@ void gsm_serdev_unregister_device(struct gsm_serdev *=
gsd)
 	gsd->gsm =3D NULL;
 }
 EXPORT_SYMBOL_GPL(gsm_serdev_unregister_device);
-
+#endif
 #endif	/* CONFIG_SERIAL_DEV_BUS */
=20
 /**
@@ -3644,7 +3640,7 @@ static int gsmtty_break_ctl(struct tty_struct *tty, i=
nt state)
 				    properly */
 		encode =3D 0x0F;
 	else if (state > 0) {
-		encode =3D state / 200;	/* mS to encoding */
+		encode =3D state / 200;	/* ms to encoding */
 		if (encode > 0x0F)
 			encode =3D 0x0F;	/* Best effort */
 	}
diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index c5f0d936b003..081702d5479d 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -121,7 +121,7 @@ int serdev_device_add(struct serdev_device *serdev)
 		goto err_clear_serdev;
 	}
=20
-	dev_dbg(&serdev->dev, "device %s registered\n", dev_name(&serdev->dev));
+	dev_info(&serdev->dev, "device %s registered, %p controller %p\n", dev_na=
me(&serdev->dev), serdev, ctrl);
=20
 	return 0;
=20
@@ -509,7 +509,15 @@ struct serdev_controller *serdev_controller_alloc(stru=
ct device *parent,
 	pm_runtime_no_callbacks(&ctrl->dev);
 	pm_suspend_ignore_children(&ctrl->dev, true);
=20
-	dev_dbg(&ctrl->dev, "allocated controller 0x%p id %d\n", ctrl, id);
+	/* /sys/bus/serial/drivers/serdev_ngsm/serial0-0 ?
+
+4806a000.serial:modem:audio-codec@2  modalias  subsystem
+4806a000.serial:modem:gnss@4	     of_node   supplier:phy-usb-phy@1.1
+driver				     power     uevent
+
+	*/
+	dev_info(&ctrl->dev, "allocated controller 0x%p 0x%p id %d [%d]\n",
+		 ctrl, &ctrl->dev, id, ctrl->nr);
 	return ctrl;
=20
 err_free:
@@ -527,10 +535,12 @@ static int of_serdev_register_devices(struct serdev_c=
ontroller *ctrl)
 	bool found =3D false;
=20
 	for_each_available_child_of_node(ctrl->dev.of_node, node) {
+		dev_info(&ctrl->dev, "of_serdev_register_device: considering %pOF\n", no=
de);
+	=09
 		if (!of_get_property(node, "compatible", NULL))
 			continue;
=20
-		dev_dbg(&ctrl->dev, "adding child %pOF\n", node);
+		dev_info(&ctrl->dev, "adding child %pOF\n", node);
=20
 		serdev =3D serdev_device_alloc(ctrl);
 		if (!serdev)
@@ -740,26 +750,34 @@ int serdev_controller_add(struct serdev_controller *c=
trl)
 {
 	int ret_of, ret_acpi, ret;
=20
+	printk("serdev_controller_add...\n");
+
 	/* Can't register until after driver model init */
 	if (WARN_ON(!is_registered))
 		return -EAGAIN;
=20
+	printk("serdev_controller_add 1... %pOF\n", ctrl->dev.of_node);
+=09
 	ret =3D device_add(&ctrl->dev);
 	if (ret)
 		return ret;
=20
+	printk("serdev_controller_add 2...\n");=09
 	pm_runtime_enable(&ctrl->dev);
=20
 	ret_of =3D of_serdev_register_devices(ctrl);
 	ret_acpi =3D acpi_serdev_register_devices(ctrl);
 	if (ret_of && ret_acpi) {
-		dev_dbg(&ctrl->dev, "no devices registered: of:%pe acpi:%pe\n",
+		dev_info(&ctrl->dev, "no devices registered: of:%pe acpi:%pe\n",
 			ERR_PTR(ret_of), ERR_PTR(ret_acpi));
+#if 0
 		ret =3D -ENODEV;
 		goto err_rpm_disable;
+#endif	=09
 	}
=20
-	dev_dbg(&ctrl->dev, "serdev%d registered: dev:%p\n",
+	printk("serdev_controller_add all ok?...\n");	=09
+	dev_info(&ctrl->dev, "serdev%d registered: dev:%p\n",
 		ctrl->nr, &ctrl->dev);
 	return 0;
=20
diff --git a/drivers/tty/serdev/serdev-ngsm.c b/drivers/tty/serdev/serdev-n=
gsm.c
index a247cf36df4f..e8db5cc5b19d 100644
--- a/drivers/tty/serdev/serdev-ngsm.c
+++ b/drivers/tty/serdev/serdev-ngsm.c
@@ -40,7 +40,7 @@ struct serdev_ngsm {
 	const struct serdev_ngsm_cfg *cfg;
 };
=20
-static int serdev_ngsm_tty_init(struct serdev_ngsm *ddata)
+static int serdev_ngsm_tty_init(struct serdev_ngsm *ddata, void *node /* w=
ill need of node here ? */)
 {
 	struct gsm_serdev *gsd =3D &ddata->gsd;
 	struct device *dev =3D ddata->dev;
@@ -50,7 +50,7 @@ static int serdev_ngsm_tty_init(struct serdev_ngsm *ddata)
 		if (BIT_ULL(bit) & TS27010_RESERVED_DLCI)
 			continue;
=20
-		err =3D gsm_serdev_register_tty_port(gsd, bit);
+		err =3D gsm_serdev_register_tty_port(gsd, bit /*, node FIXME */);
 		if (err) {
 			dev_err(dev, "ngsm tty init failed for dlci%i: %i\n",
 				bit, err);
@@ -74,69 +74,6 @@ static void serdev_ngsm_tty_exit(struct serdev_ngsm *dda=
ta)
 	}
 }
=20
-/*
- * Note that we rely on gsm_serdev_register_dlci() locking for
- * reserved channels that serdev_ngsm_tty_init() and consumer
- * drivers may have already reserved.
- */
-int serdev_ngsm_register_dlci(struct device *dev,
-			      struct gsm_serdev_dlci *dlci)
-{
-	struct serdev_ngsm *ddata =3D gsm_serdev_get_drvdata(dev);
-	struct gsm_serdev *gsd =3D &ddata->gsd;
-	int err;
-
-	err =3D gsm_serdev_register_dlci(gsd, dlci);
-	if (err)
-		return err;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(serdev_ngsm_register_dlci);
-
-void serdev_ngsm_unregister_dlci(struct device *dev,
-				 struct gsm_serdev_dlci *dlci)
-{
-	struct serdev_ngsm *ddata =3D gsm_serdev_get_drvdata(dev);
-	struct gsm_serdev *gsd =3D &ddata->gsd;
-
-	gsm_serdev_unregister_dlci(gsd, dlci);
-}
-EXPORT_SYMBOL_GPL(serdev_ngsm_unregister_dlci);
-
-int serdev_ngsm_write(struct device *dev, struct gsm_serdev_dlci *ops,
-		      const u8 *buf, int len)
-{
-	struct serdev_ngsm *ddata =3D gsm_serdev_get_drvdata(dev);
-	struct gsm_serdev *gsd =3D &ddata->gsd;
-	int ret;
-
-	ret =3D pm_runtime_get_sync(dev);
-	if ((ret !=3D -EINPROGRESS) && ret < 0) {
-		pm_runtime_put_noidle(dev);
-
-		return ret;
-	}
-
-	ret =3D gsm_serdev_write(gsd, ops, buf, len);
-
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(serdev_ngsm_write);
-
-struct gsm_serdev_dlci *
-serdev_ngsm_get_dlci(struct device *dev, int line)
-{
-	struct serdev_ngsm *ddata =3D gsm_serdev_get_drvdata(dev);
-	struct gsm_serdev *gsd =3D &ddata->gsd;
-
-	return gsm_serdev_tty_port_get_dlci(gsd, line);
-}
-EXPORT_SYMBOL_GPL(serdev_ngsm_get_dlci);
-
 static int serdev_ngsm_set_config(struct device *dev)
 {
 	struct serdev_ngsm *ddata =3D gsm_serdev_get_drvdata(dev);
@@ -164,6 +101,7 @@ static int serdev_ngsm_set_config(struct device *dev)
 	return 0;
 }
=20
+#if 1
 static int serdev_ngsm_output(struct gsm_serdev *gsd, u8 *data, int len)
 {
 	struct serdev_device *serdev =3D gsd->serdev;
@@ -183,6 +121,7 @@ static int serdev_ngsm_output(struct gsm_serdev *gsd, u=
8 *data, int len)
=20
 	return len;
 }
+#endif
=20
 static int serdev_ngsm_runtime_suspend(struct device *dev)
 {
@@ -227,7 +166,6 @@ static const struct dev_pm_ops serdev_ngsm_pm_ops =3D {
 			   serdev_ngsm_runtime_resume,
 			   NULL)
 };
-
 /*
  * At least Motorola MDM6600 devices have GPIO wake pins shared between the
  * USB PHY and the TS 27.010 interface. So for PM, we need to use the calls
@@ -327,7 +265,8 @@ static int serdev_ngsm_probe(struct serdev_device *serd=
ev)
=20
 	gsd =3D &ddata->gsd;
 	gsd->serdev =3D serdev;
-	gsd->output =3D serdev_ngsm_output;
+	gsd->output =3D serdev_ngsm_output; /* This is real-serial line to gsm di=
rection;=20
+					     we want to keep it */
 	serdev_device_set_drvdata(serdev, gsd);
 	gsm_serdev_set_drvdata(dev, ddata);
=20
@@ -377,7 +316,7 @@ static int serdev_ngsm_probe(struct serdev_device *serd=
ev)
 	if (err)
 		goto err_close;
=20
-	err =3D serdev_ngsm_tty_init(ddata);
+	err =3D serdev_ngsm_tty_init(ddata, NULL /* FIXME! */);
 	if (err)
 		goto err_tty;
=20
diff --git a/drivers/tty/serdev/serdev-ttyport.c b/drivers/tty/serdev/serde=
v-ttyport.c
index d367803e2044..6f02a1546560 100644
--- a/drivers/tty/serdev/serdev-ttyport.c
+++ b/drivers/tty/serdev/serdev-ttyport.c
@@ -272,6 +272,8 @@ struct device *serdev_tty_port_register(struct tty_port=
 *port,
 	if (!port || !drv || !parent)
 		return ERR_PTR(-ENODEV);
=20
+	printk("serdev_tty_port_register: %p, %d\n", port, idx);
+
 	ctrl =3D serdev_controller_alloc(parent, sizeof(struct serport));
 	if (!ctrl)
 		return ERR_PTR(-ENOMEM);
@@ -291,9 +293,12 @@ struct device *serdev_tty_port_register(struct tty_por=
t *port,
 		goto err_reset_data;
=20
 	dev_info(&ctrl->dev, "tty port %s%d registered\n", drv->name, idx);
+	printk("serdev_tty_port_register: controller is  %p, serdev %p\n", ctrl, =
ctrl->serdev);
+=09
 	return &ctrl->dev;
=20
 err_reset_data:
+	printk("serdev_tty_port_register: error?\n");
 	port->client_data =3D NULL;
 	port->client_ops =3D &tty_port_default_client_ops;
 	serdev_controller_put(ctrl);
diff --git a/include/linux/serdev-gsm.h b/include/linux/serdev-gsm.h
index 4fa819a6e366..5bdc8143b7df 100644
--- a/include/linux/serdev-gsm.h
+++ b/include/linux/serdev-gsm.h
@@ -7,7 +7,7 @@
 #include <linux/serdev.h>
 #include <linux/types.h>
=20
-struct gsm_serdev_dlci;
+struct gsm_serdev_dlci_operations;
 struct gsm_config;
=20
 /**
@@ -28,16 +28,16 @@ struct gsm_serdev {
 };
=20
 /**
- * struct gsm_serdev_dlci - serdev-gsm ts 27.010 channel data
+ * struct gsm_serdev_dlci_operations - serdev-gsm ts 27.010 channel data
  * @gsd:		serdev-gsm instance
  * @line:		ts 27.010 channel, control channel 0 is not available
  * @receive_buf:	function to handle data received for the channel
  * @drvdata:		dlci specific consumer driver data
  */
-struct gsm_serdev_dlci {
+struct gsm_serdev_dlci_operations {
 	struct gsm_serdev *gsd;
 	int line;
-	int (*receive_buf)(struct gsm_serdev_dlci *ops,
+	int (*receive_buf)(struct gsm_serdev_dlci_operations *ops,
 			   const unsigned char *buf,
 			   size_t len);
 	void *drvdata;
@@ -48,12 +48,12 @@ struct gsm_serdev_dlci {
 /* TS 27.010 channel specific functions for consumer drivers */
 #if IS_ENABLED(CONFIG_SERIAL_DEV_N_GSM)
 extern int
-serdev_ngsm_register_dlci(struct device *dev, struct gsm_serdev_dlci *dlci=
);
+serdev_ngsm_register_dlci(struct device *dev, struct gsm_serdev_dlci_opera=
tions *dlci);
 extern void serdev_ngsm_unregister_dlci(struct device *dev,
-					struct gsm_serdev_dlci *dlci);
-extern int serdev_ngsm_write(struct device *dev, struct gsm_serdev_dlci *o=
ps,
+					struct gsm_serdev_dlci_operations *dlci);
+extern int serdev_ngsm_write(struct device *dev, struct gsm_serdev_dlci_op=
erations *ops,
 			     const u8 *buf, int len);
-extern struct gsm_serdev_dlci *
+extern struct gsm_serdev_dlci_operations *
 serdev_ngsm_get_dlci(struct device *dev, int line);
 #endif
=20
@@ -62,7 +62,7 @@ extern int gsm_serdev_register_device(struct gsm_serdev *=
gsd);
 extern void gsm_serdev_unregister_device(struct gsm_serdev *gsd);
 extern int gsm_serdev_register_tty_port(struct gsm_serdev *gsd, int line);
 extern void gsm_serdev_unregister_tty_port(struct gsm_serdev *gsd, int lin=
e);
-extern struct gsm_serdev_dlci *
+extern struct gsm_serdev_dlci_operations *
 gsm_serdev_tty_port_get_dlci(struct gsm_serdev *gsd, int line);
=20
 static inline void *gsm_serdev_get_drvdata(struct device *dev)
@@ -88,10 +88,10 @@ static inline void gsm_serdev_set_drvdata(struct device=
 *dev, void *drvdata)
 extern int gsm_serdev_get_config(struct gsm_serdev *gsd, struct gsm_config=
 *c);
 extern int gsm_serdev_set_config(struct gsm_serdev *gsd, struct gsm_config=
 *c);
 extern int
-gsm_serdev_register_dlci(struct gsm_serdev *gsd, struct gsm_serdev_dlci *o=
ps);
+gsm_serdev_register_dlci(struct gsm_serdev *gsd, struct gsm_serdev_dlci_op=
erations *ops);
 extern void
-gsm_serdev_unregister_dlci(struct gsm_serdev *gsd, struct gsm_serdev_dlci =
*ops);
-extern int gsm_serdev_write(struct gsm_serdev *gsd, struct gsm_serdev_dlci=
 *ops,
+gsm_serdev_unregister_dlci(struct gsm_serdev *gsd, struct gsm_serdev_dlci_=
operations *ops);
+extern int gsm_serdev_write(struct gsm_serdev *gsd, struct gsm_serdev_dlci=
_operations *ops,
 			    const u8 *buf, int len);
 extern void gsm_serdev_data_kick(struct gsm_serdev *gsd);
=20
@@ -118,7 +118,7 @@ void gsm_serdev_unregister_tty_port(struct gsm_serdev *=
gsd, int line)
 {
 }
=20
-static inline struct gsm_serdev_dlci *
+static inline struct gsm_serdev_dlci_operations *
 gsm_serdev_tty_port_get_dlci(struct gsm_serdev *gsd, int line)
 {
 	return NULL;
@@ -148,19 +148,19 @@ int gsm_serdev_set_config(struct gsm_serdev *gsd, str=
uct gsm_config *c)
=20
 static inline
 int gsm_serdev_register_dlci(struct gsm_serdev *gsd,
-			     struct gsm_serdev_dlci *ops)
+			     struct gsm_serdev_dlci_operations *ops)
 {
 	return -ENODEV;
 }
=20
 static inline
 void gsm_serdev_unregister_dlci(struct gsm_serdev *gsd,
-				struct gsm_serdev_dlci *ops)
+				struct gsm_serdev_dlci_operations *ops)
 {
 }
=20
 static inline
-int gsm_serdev_write(struct gsm_serdev *gsd, struct gsm_serdev_dlci *ops,
+int gsm_serdev_write(struct gsm_serdev *gsd, struct gsm_serdev_dlci_operat=
ions *ops,
 		     const u8 *buf, int len)
 {
 	return -ENODEV;
diff --git a/include/linux/serdev.h b/include/linux/serdev.h
index 9f14f9c12ec4..efdffe34a9b5 100644
--- a/include/linux/serdev.h
+++ b/include/linux/serdev.h
@@ -128,6 +128,7 @@ static inline void serdev_device_set_drvdata(struct ser=
dev_device *serdev, void
  */
 static inline void serdev_device_put(struct serdev_device *serdev)
 {
+	printk("serdev_device_put... %p\n", serdev);
 	if (serdev)
 		put_device(&serdev->dev);
 }
@@ -156,6 +157,8 @@ static inline void serdev_controller_set_drvdata(struct=
 serdev_controller *ctrl,
  */
 static inline void serdev_controller_put(struct serdev_controller *ctrl)
 {
+	printk("serdev_controller_put... %p\n", ctrl);
+	WARN_ON(1);
 	if (ctrl)
 		put_device(&ctrl->dev);
 }
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index afb9521ddf91..530a0146893c 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -802,7 +802,7 @@ static char *ptr_to_id(char *buf, char *end, const void=
 *ptr,
 	 * Print the real pointer value for NULL and error pointers,
 	 * as they are not actual addresses.
 	 */
-	if (IS_ERR_OR_NULL(ptr))
+//	if (IS_ERR_OR_NULL(ptr))
 		return pointer_string(buf, end, ptr, spec);
=20
 	/* When debugging early boot use non-cryptographically secure hash. */
diff --git a/sound/soc/codecs/motmdm.c b/sound/soc/codecs/motmdm.c
index 325a860ef665..1528c89d9d57 100644
--- a/sound/soc/codecs/motmdm.c
+++ b/sound/soc/codecs/motmdm.c
@@ -28,7 +28,7 @@ struct motmdm_driver_data {
 	struct snd_soc_component *component;
 	struct snd_soc_dai *master_dai;
 	struct device *modem;
-	struct gsm_serdev_dlci dlci;
+	struct gsm_serdev_dlci_operations dlci;
 	struct regmap *regmap;
 	unsigned char *buf;
 	size_t len;
@@ -38,7 +38,7 @@ struct motmdm_driver_data {
 	struct mutex mutex;	/* for sending commands */
 	wait_queue_head_t read_queue;
=20
-	int (*receive_buf_orig)(struct gsm_serdev_dlci *ops,
+	int (*receive_buf_orig)(struct gsm_serdev_dlci_operations *ops,
 				const unsigned char *buf,
 				size_t len);
 	unsigned int dtmf_val;
@@ -121,7 +121,7 @@ static int motmdm_send_command(struct motmdm_driver_dat=
a *ddata,
 }
=20
 /* Handle U1234+XXXX=3D style command response */
-static int motmdm_receive_data(struct gsm_serdev_dlci *dlci,
+static int motmdm_receive_data(struct gsm_serdev_dlci_operations *dlci,
 			       const unsigned char *buf,
 			       size_t len)
 {
@@ -569,7 +569,7 @@ static void motmdm_voice_get_state(struct motmdm_driver=
_data *ddata,
 		motmdm_disable_primary_dai(ddata->component);
 }
=20
-static int receive_buf_voice(struct gsm_serdev_dlci *ops,
+static int receive_buf_voice(struct gsm_serdev_dlci_operations *ops,
 			     const unsigned char *buf,
 			     size_t len)
 {
@@ -585,7 +585,7 @@ static int receive_buf_voice(struct gsm_serdev_dlci *op=
s,
 /* Read the voice status from dlci1 and let user space handle rest */
 static int motmdm_init_voice_dlci(struct motmdm_driver_data *ddata)
 {
-	struct gsm_serdev_dlci *dlci;
+	struct gsm_serdev_dlci_operations *dlci;
=20
 	dlci =3D serdev_ngsm_get_dlci(ddata->modem, MOTMDM_VOICE_DLCI);
 	if (!dlci)
@@ -600,7 +600,7 @@ static int motmdm_init_voice_dlci(struct motmdm_driver_=
data *ddata)
=20
 static void motmdm_free_voice_dlci(struct motmdm_driver_data *ddata)
 {
-	struct gsm_serdev_dlci *dlci;
+	struct gsm_serdev_dlci_operations *dlci;
=20
 	dlci =3D serdev_ngsm_get_dlci(ddata->modem, MOTMDM_VOICE_DLCI);
 	if (!dlci)
@@ -613,7 +613,7 @@ static void motmdm_free_voice_dlci(struct motmdm_driver=
_data *ddata)
 static int motmdm_soc_probe(struct snd_soc_component *component)
 {
 	struct motmdm_driver_data *ddata;
-	struct gsm_serdev_dlci *dlci;
+	struct gsm_serdev_dlci_operations *dlci;
 	const unsigned char *cmd =3D "AT+CMUT=3D0";
 	int error;
 	u32 line;
@@ -690,7 +690,7 @@ static int motmdm_soc_probe(struct snd_soc_component *c=
omponent)
 static void motmdm_soc_remove(struct snd_soc_component *component)
 {
 	struct motmdm_driver_data *ddata;
-	struct gsm_serdev_dlci *dlci;
+	struct gsm_serdev_dlci_operations *dlci;
=20
 	ddata =3D snd_soc_component_get_drvdata(component);
 	dlci =3D &ddata->dlci;
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio=
-graph-card.c
index 97b4f5480a31..31ff426226ef 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -631,6 +631,8 @@ static int graph_probe(struct platform_device *pdev)
 	struct link_info li;
 	int ret;
=20
+	printk("audio-graph: probe starts\n");
+
 	/* Allocate the private data and the DAI link array */
 	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -648,19 +650,24 @@ static int graph_probe(struct platform_device *pdev)
 	if (!li.link || !li.dais)
 		return -EINVAL;
=20
+	printk("audio-graph: 2\n");
+
 	ret =3D asoc_simple_init_priv(priv, &li);
 	if (ret < 0)
 		return ret;
=20
 	priv->pa_gpio =3D devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->pa_gpio)) {
+		printk("audio-graph: optional pa failed\n");
 		ret =3D PTR_ERR(priv->pa_gpio);
 		dev_err(dev, "failed to get amplifier gpio: %d\n", ret);
 		return ret;
 	}
=20
+	printk("audio-graph: parsing of\n");=09
 	ret =3D graph_parse_of(priv);
 	if (ret < 0) {
+		printk("audio-graph: parsing of failed: %d\n", ret);=09
 		if (ret !=3D -EPROBE_DEFER)
 			dev_err(dev, "parse error %d\n", ret);
 		goto err;
@@ -670,9 +677,13 @@ static int graph_probe(struct platform_device *pdev)
=20
 	asoc_simple_debug_info(priv);
=20
+		printk("audio-graph: registering card\n");=09
+=09
+
 	ret =3D devm_snd_soc_register_card(dev, card);
 	if (ret < 0)
 		goto err;
+		printk("audio-graph: all ok\n");=09
=20
 	return 0;
 err:


--=20
http://www.livejournal.com/~pavelmachek

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX9/UsAAKCRAw5/Bqldv6
8l0GAJ9DOUoR1QiHyLHO4qzCCaM5l2ugUwCggyJ5vd5Jzi8hH+kwYm8CKgGVdX4=
=Y5Os
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
