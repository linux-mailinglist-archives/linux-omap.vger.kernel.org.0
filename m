Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960B01B93DC
	for <lists+linux-omap@lfdr.de>; Sun, 26 Apr 2020 22:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbgDZUHX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 26 Apr 2020 16:07:23 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58066 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgDZUHW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 26 Apr 2020 16:07:22 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F01F11C0246; Sun, 26 Apr 2020 22:07:19 +0200 (CEST)
Date:   Sun, 26 Apr 2020 22:07:18 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Pavel Machek <pavel@denx.de>, Johan Hovold <johan@kernel.org>,
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
Message-ID: <20200426200718.GA22980@amd>
References: <20200421232752.3070-1-tony@atomide.com>
 <20200423114326.GQ18608@localhost>
 <20200424215040.GA14087@amd>
 <20200424221515.GM37466@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20200424221515.GM37466@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > Here's v4 set of n_gsm serdev support patches, and the related prot=
ocol
> > > > driver for the modem found on Motorola Mapphone phones and tablets
> > > > like droid4.
> > > >=20
> > > > This series only adds basic character device support for the serdev
> > > > driver. Other serdev consumer drivers for specific devices will be
> > > > posted separately.
> > >=20
> > > I'm still missing an architectural (design) overview here -- reviewer
> > > time is a scarce resource.
> > >=20
> > > I also suggested earlier that you include, at least as an RFC, one or
> > > more of your child-device drivers so that we can see how this ends up
> > > being used in the end (including an example devicetree).
> >=20
> > Note that this is useful on its own: we have ofonod running on the top
> > of this doing calls and SMSes.
>=20
> Yup.
>=20
> > Tony: I know you have drivers depending on this somewhere (audio
> > routing and GPS), but I can't find them. It is not droid4-pending-v5.6
> > AFAICT. Do you have a pointer / could you publish them somewhere?
>=20
> Hmm they should be there in droid4-pending-v5.6 branch [0]:
>=20
> $ git log --abbrev=3D12 --pretty=3Dformat:"%h (\"%s\")" \
> 	v5.6..droid4-pending-v5.6 | grep -i -e gsm -e mot -e mdm
> e09590a260a4 ("mfd: motmdm: Fix oops on unload of motorola-mdm")
> f9252f9ff6bd ("mfd: motmdm: Revert bad list change")
> d733dcaf4416 ("mfd: motmdm: Fix issue with receiving data before ddata is=
 set")
> 452d2b5d4c95 ("n_gsm: Build fixes for make randconfig build")
> 6882b27ea92a ("phy: mapphone-mdm6600: Fix write timeouts with shorter GPI=
O toggle interval")
> 58ff58c4b520 ("mfd: motmdm: Add basic DTMF support")
> e92b6f30e5ae ("ASoC: audio-graph-card: Add audio mixer for motorold mdm66=
00")
> c2caea5767d5 ("gnss: mot-mdm6600: Add support for Motorola Mapphone MDM66=
00 modem")
> a5f73b7b06f6 ("mfd: motmdm: Add Motorola TS 27.010 serdev driver for devi=
ces like droid4")
> 6c311d5aeb0a ("dt-bindings: mfd: motmdm: Add binding for motorola-mdm")
> cd02274b920e ("tty: n_gsm: Add support for serdev drivers")
> a73a48321c98 ("phy: mapphone-mdm6600: Fix timeouts by adding wake-up hand=
ling")

Here's better try at getting gnss to work on top of linux-next... but
still no luck.

diff --git a/drivers/gnss/Kconfig b/drivers/gnss/Kconfig
index 960178dfad47..13b91034e3ea 100644
--- a/drivers/gnss/Kconfig
+++ b/drivers/gnss/Kconfig
@@ -15,7 +15,6 @@ if GNSS
=20
 config GNSS_MOTMDM
 	tristate "Motorola Modem TS 27.010 serdev GNSS receiver support"
-	depends on MFD_MOTMDM
 	---help---
 	  Say Y here if you have a Motorola modem using TS 27.010 line
 	  discipline for GNSS such as a Motorola Mapphone series device
diff --git a/drivers/gnss/motmdm.c b/drivers/gnss/motmdm.c
index 5ec2fa25df6f..426e9da6bb12 100644
--- a/drivers/gnss/motmdm.c
+++ b/drivers/gnss/motmdm.c
@@ -21,6 +21,8 @@
=20
 #include <linux/mfd/motorola-mdm.h>
=20
+#define DEBUG
+
 #define MOTMDM_GNSS_TIMEOUT	1000
 #define MOTMDM_GNSS_RATE	1000
=20
@@ -197,6 +199,8 @@ static int motmdm_gnss_receive_data(struct motmdm_dlci =
*mot_dlci,
 	if (len <=3D MOTMDM_GNSS_MPD_LEN)
 		return 0;
=20
+	printk("gnss: Have %d bytes of data\n", len);
+
 	switch (buf[MOTMDM_GNSS_MPD_LEN]) {
 	case 'N':	/* UNNNN~+MPDNMEA=3DNN, */
 		msg =3D buf + MOTMDM_GNSS_NMEA_LEN;
diff --git a/drivers/tty/serdev/protocol/serdev-ngsm-motmdm.c b/drivers/tty=
/serdev/protocol/serdev-ngsm-motmdm.c
index 97eb349f5f13..15353e228b18 100644
--- a/drivers/tty/serdev/protocol/serdev-ngsm-motmdm.c
+++ b/drivers/tty/serdev/protocol/serdev-ngsm-motmdm.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2018 - 2020 Tony Lindgren <tony@atomide.com>
  */
=20
+#define DEBUG
 #include <linux/cdev.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -26,6 +27,8 @@
 #include <linux/mfd/core.h>
 #include <linux/phy/phy.h>
=20
+#include <linux/mfd/motorola-mdm.h>
+
 #include <uapi/linux/gsmmux.h>
=20
 #define MOTMDM_C_N2		3	/* TS27.010 default value */
@@ -67,36 +70,6 @@ struct motmdm_response {
 	unsigned int handled:1;
 };
=20
-enum motmdm_dlci_nr {
-	MOTMDM_DLCI1 =3D 1,
-	MOTMDM_DLCI2,
-	MOTMDM_DLCI3,
-	MOTMDM_DLCI4,
-	MOTMDM_DLCI5,
-	MOTMDM_DLCI6,
-	MOTMDM_DLCI7,
-	MOTMDM_DLCI8,
-	MOTMDM_DLCI9,
-	MOTMDM_DLCI10,
-	MOTMDM_DLCI11,
-	MOTMDM_DLCI12,
-	MOTMDM_DLCI13,
-	MOTMDM_DLCI14,
-	MOTMDM_DLCI15,
-};
-
-struct motmdm_dlci {
-	struct gsm_serdev_dlci gsm_dlci;
-	struct list_head node;
-	wait_queue_head_t read_queue;
-	struct kfifo read_fifo;
-	int line;
-	u16 id;
-	struct list_head list;
-	void *privdata;		/* Do not use, internal data */
-	void *drvdata;		/* Available for consumer drivers */
-};
-
 struct motmdm_cdev {
 	struct motmdm *ddata;
 	struct list_head node;
@@ -283,6 +256,10 @@ static int motmdm_dlci_handle_command(struct motmdm_dl=
ci *mot_dlci, int id,
 			break;
 	}
=20
+	if (mot_dlci->receive_data) {
+		return (*mot_dlci->receive_data)(mot_dlci, buf, len);
+	}
+
 	if (!resp || !resp->buf)
 		return -ENODEV;
=20
@@ -415,7 +392,7 @@ static int motmdm_write(struct device *dev, struct motm=
dm_dlci *mot_dlci,
  * Helper for child device drivers to send a command to a DLCI and wait
  * for result with a matching packet ID.
  */
-static int motmdm_send_command(struct device *dev,
+int motmdm_send_command(struct device *dev,
 			       struct motmdm_dlci *mot_dlci,
 			       unsigned long timeout_ms,
 			       const unsigned char *cmd, size_t cmdlen,
@@ -477,7 +454,7 @@ static int motmdm_send_command(struct device *dev,
 	return err;
 }
=20
-static int motmdm_register_dlci(struct device *dev,
+int motmdm_register_dlci(struct device *dev,
 				struct motmdm_dlci *mot_dlci)
 {
 	struct motmdm *ddata;
@@ -522,7 +499,7 @@ static int motmdm_register_dlci(struct device *dev,
 	return err;
 }
=20
-static void motmdm_unregister_dlci(struct device *dev,
+void motmdm_unregister_dlci(struct device *dev,
 				   struct motmdm_dlci *mot_dlci)
 {
 	struct motmdm *ddata;
diff --git a/include/linux/mfd/motorola-mdm.h b/include/linux/mfd/motorola-=
mdm.h
new file mode 100644
index 000000000000..70c52304ffff
--- /dev/null
+++ b/include/linux/mfd/motorola-mdm.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+struct gsm_serdev_dlci;
+struct kfifo;
+struct motmdm_response;
+
+enum motmdm_dlci_nr {
+	MOTMDM_DLCI1 =3D 1,
+	MOTMDM_DLCI2,
+	MOTMDM_DLCI3,
+	MOTMDM_DLCI4,
+	MOTMDM_DLCI5,
+	MOTMDM_DLCI6,
+	MOTMDM_DLCI7,
+	MOTMDM_DLCI8,
+	MOTMDM_DLCI9,
+	MOTMDM_DLCI10,
+	MOTMDM_DLCI11,
+	MOTMDM_DLCI12,
+	MOTMDM_DLCI13,
+	MOTMDM_DLCI14,
+	MOTMDM_DLCI15,
+};
+
+enum motmdm_state {
+	MOTMDM_STATE_IDLE =3D 0,
+	MOTMDM_STATE_DIAL =3D 1,
+	MOTMDM_STATE_ANSWERING =3D 2,
+	MOTMDM_STATE_CONNECTING =3D 3,
+	MOTMDM_STATE_INCOMING =3D 4,
+	MOTMDM_STATE_CONNECTED =3D 5,
+	MOTMDM_STATE_HANGING_UP =3D 6,
+	MOTMDM_STATE_DISCONNECTED =3D 7,
+};
+
+struct motmdm_dlci {
+	struct gsm_serdev_dlci gsm_dlci;
+	struct list_head node;
+	wait_queue_head_t read_queue;
+	struct kfifo read_fifo;
+	int line;
+	u16 id;
+	struct list_head list;
+	void *privdata;		/* Do not use, internal data */
+	void *drvdata;		/* Available for consumer drivers */
+=09
+	int (*receive_data)(struct motmdm_dlci *mot_dlci,
+			    const unsigned char *buf,
+			    size_t len);
+};
+
+int motmdm_register_dlci(struct device *dev, struct motmdm_dlci *mot_dlci);
+void motmdm_unregister_dlci(struct device *dev, struct motmdm_dlci *mot_dl=
ci);
+
+extern int motmdm_send_command(struct device *dev,
+			       struct motmdm_dlci *mot_dlci,
+			       unsigned long timeout_ms,
+			       const unsigned char *cmd, size_t cmdlen,
+			       unsigned char *rsp, size_t rsplen);
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 3635fc0ab2a6..63d8d3e731ff 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -878,7 +878,6 @@ config SND_SOC_MAX9860
=20
 config SND_SOC_MOTMDM
 	tristate "Motorola Modem TS 27.010 Voice Call Codec"
-	depends on MFD_MOTMDM
 	help
 	  Enable support for Motorola TS 27.010 line discipline serdev
 	  voice call codec driver for Motorola Mapphone series of devices

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6l6fYACgkQMOfwapXb+vK5OQCgloowj2nVOScbZ6teYh401qXu
5M0AnAk/spI2NsxRVEUx/Fx2ABRQsDqg
=0cCt
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
