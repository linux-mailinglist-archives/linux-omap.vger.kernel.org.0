Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0581AC81F
	for <lists+linux-omap@lfdr.de>; Thu, 16 Apr 2020 17:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394889AbgDPPDq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Apr 2020 11:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730395AbgDPPDo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Apr 2020 11:03:44 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B41C061A0C;
        Thu, 16 Apr 2020 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587049420;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Pi+VQYbtPnq+pyUA10wnTfuvzyyV3GV2cUaBYZeEw90=;
        b=eis488nn4LBqo0s/tc/9E7cjMz9Ck/KfNBrfE7VS7jWMRHbLgV+0jOkNi7f/ZyndN6
        luh4qH+P54/NRyjtrHXWK8lZE9Id/cqQnJnORyCm0R8PIlIYwZx8IrvQZa74gxV6e03G
        r1pkzTwqHQ9zKcsHlw7aHLvWpDi3u6/qi1D184mFIEnCmu91yXCPU3vyGSSwS2Z5QHBp
        7w758lVX7LmqdMeIxrCYrUPvkLa/jKyxhUbp1LUTSCrQ7dGwC/HTWKTGJW1lycL3CicA
        LGS6aB3L4a7Xglz0D2nUbKTrn4GPFwQHDisIXyw0IJl5582xEA1Qs2FtFRAxibpzxNl5
        8JhQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAuw4XvCA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3GF2T7JE
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 16 Apr 2020 17:02:29 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191217004048.46298-1-tony@atomide.com>
Date:   Thu, 16 Apr 2020 17:02:28 +0200
Cc:     Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com>
References: <20191217004048.46298-1-tony@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,
it looks as if something with this patch is broken on GTA04. For v5.6 =
and v5.7-rc1.

HDQ battery access times out after ca. 15 seconds and I get temperature =
of -273.1=C2=B0C...

Reverting this patch and everything is ok again.

What is "ti,mode" about? Do we have that (indirectly) in gta04.dtsi?
Or does this patch need some CONFIGs we do not happen to have?

BR and thanks,
Nikolaus

root@letux:~# time cat /sys/class/power_supply/bq27000-battery/uevent
POWER_SUPPLY_NAME=3Dbq27000-battery
POWER_SUPPLY_STATUS=3DDischarging
POWER_SUPPLY_PRESENT=3D1
POWER_SUPPLY_VOLTAGE_NOW=3D0
POWER_SUPPLY_CURRENT_NOW=3D0
POWER_SUPPLY_CAPACITY=3D0
POWER_SUPPLY_CAPACITY_LEVEL=3DNormal
POWER_SUPPLY_TEMP=3D-2731
POWER_SUPPLY_TIME_TO_EMPTY_NOW=3D0
POWER_SUPPLY_TIME_TO_EMPTY_AVG=3D0
POWER_SUPPLY_TIME_TO_FULL_NOW=3D0
POWER_SUPPLY_TECHNOLOGY=3DLi-ion
POWER_SUPPLY_CHARGE_FULL=3D0
POWER_SUPPLY_CHARGE_NOW=3D0
POWER_SUPPLY_CHARGE_FULL_DESIGN=3D0
POWER_SUPPLY_CYCLE_COUNT=3D0
POWER_SUPPLY_ENERGY_NOW=3D0
POWER_SUPPLY_POWER_AVG=3D0
POWER_SUPPLY_HEALTH=3DGood
POWER_SUPPLY_MANUFACTURER=3DTexas Instruments

real    0m15.761s
user    0m0.001s
sys     0m0.025s
root@letux:~#=20
root@letux:~# dmesg|fgrep -i hdq
[   20.252136] omap_hdq 480b2000.1w: OMAP HDQ Hardware Rev 0.5. Driver =
in Interrupt mode
root@letux:~#

> Am 17.12.2019 um 01:40 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> We've had generic code handling module sysconfig and OCP reset =
registers
> for omap variants for many years now and all the drivers really needs =
to
> do is just call runtime PM functions.
>=20
> Looks like the omap-hdq driver got only partially updated over the =
years
> to use runtime PM, and still has lots of custom PM code left.
>=20
> We can replace all the custom code for sysconfig, OCP reset, and PM =
with
> just a few lines of runtime PM autosuspend code.
>=20
> In order to set the device mode properly when pm_runtime_get_sync() is
> called during probe, we need to also move parsing of "ti,mode" to =
happen
> earlier before we call pm_runtime_enable().
>=20
> Since we now disable interrupts lazily in omap_hdq_runtime_suspend(), =
we
> must remove the call to hdq_disable_interrupt() in =
omap_w1_read_byte().
> And we must clear irqstatus calling wait_event_timeout() on it, so =
let's
> add hdq_reset_irqstatus() for that.
>=20
> Note that the earlier driver specific usage count limit of four seems
> completely artificial and should not be an issue in normal use.
>=20
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Andrew F. Davis <afd@ti.com>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Vignesh R <vigneshr@ti.com>
> Tested-by: Andreas Kemnade <andreas@kemnade.info> # gta04
> Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>=20
> Changes since v2:
>=20
> - Added hdq_reset_irqstatus() and fixed up the calls so ti,mode =3D =
"1w"
>  works
>=20
> - Kept earlier Tested-by from Adam and Andreas as the =
hdq_reset_irqstatus()
>  fix only affected "1w" mode and not "hdq" mode
>=20
> Changes since v1:
>=20
> - Drop call to hdq_disable_interrupt() as we now disable interrupts
>  lazily un runtime_suspend
>=20
> - Parse "ti,mode" earlier before first pm_runtime_get_sync() so the
>  mode gets set properly also during the probe
>=20
>=20
> drivers/w1/masters/omap_hdq.c | 348 +++++++++++-----------------------
> 1 file changed, 113 insertions(+), 235 deletions(-)
>=20
> diff --git a/drivers/w1/masters/omap_hdq.c =
b/drivers/w1/masters/omap_hdq.c
> --- a/drivers/w1/masters/omap_hdq.c
> +++ b/drivers/w1/masters/omap_hdq.c
> @@ -38,12 +38,6 @@
> #define OMAP_HDQ_INT_STATUS_TXCOMPLETE		BIT(2)
> #define OMAP_HDQ_INT_STATUS_RXCOMPLETE		BIT(1)
> #define OMAP_HDQ_INT_STATUS_TIMEOUT		BIT(0)
> -#define OMAP_HDQ_SYSCONFIG			0x14
> -#define OMAP_HDQ_SYSCONFIG_SOFTRESET		BIT(1)
> -#define OMAP_HDQ_SYSCONFIG_AUTOIDLE		BIT(0)
> -#define OMAP_HDQ_SYSCONFIG_NOIDLE		0x0
> -#define OMAP_HDQ_SYSSTATUS			0x18
> -#define OMAP_HDQ_SYSSTATUS_RESETDONE		BIT(0)
>=20
> #define OMAP_HDQ_FLAG_CLEAR			0
> #define OMAP_HDQ_FLAG_SET			1
> @@ -62,17 +56,9 @@ struct hdq_data {
> 	void __iomem		*hdq_base;
> 	/* lock status update */
> 	struct  mutex		hdq_mutex;
> -	int			hdq_usecount;
> 	u8			hdq_irqstatus;
> 	/* device lock */
> 	spinlock_t		hdq_spinlock;
> -	/*
> -	 * Used to control the call to omap_hdq_get and omap_hdq_put.
> -	 * HDQ Protocol: Write the CMD|REG_address first, followed by
> -	 * the data wrire or read.
> -	 */
> -	int			init_trans;
> -	int                     rrw;
> 	/* mode: 0-HDQ 1-W1 */
> 	int                     mode;
>=20
> @@ -99,15 +85,6 @@ static inline u8 hdq_reg_merge(struct hdq_data =
*hdq_data, u32 offset,
> 	return new_val;
> }
>=20
> -static void hdq_disable_interrupt(struct hdq_data *hdq_data, u32 =
offset,
> -				  u32 mask)
> -{
> -	u32 ie;
> -
> -	ie =3D readl(hdq_data->hdq_base + offset);
> -	writel(ie & mask, hdq_data->hdq_base + offset);
> -}
> -
> /*
>  * Wait for one or more bits in flag change.
>  * HDQ_FLAG_SET: wait until any bit in the flag is set.
> @@ -142,22 +119,24 @@ static int hdq_wait_for_flag(struct hdq_data =
*hdq_data, u32 offset,
> 	return ret;
> }
>=20
> +/* Clear saved irqstatus after using an interrupt */
> +static void hdq_reset_irqstatus(struct hdq_data *hdq_data)
> +{
> +	unsigned long irqflags;
> +
> +	spin_lock_irqsave(&hdq_data->hdq_spinlock, irqflags);
> +	hdq_data->hdq_irqstatus =3D 0;
> +	spin_unlock_irqrestore(&hdq_data->hdq_spinlock, irqflags);
> +}
> +
> /* write out a byte and fill *status with HDQ_INT_STATUS */
> static int hdq_write_byte(struct hdq_data *hdq_data, u8 val, u8 =
*status)
> {
> 	int ret;
> 	u8 tmp_status;
> -	unsigned long irqflags;
>=20
> 	*status =3D 0;
>=20
> -	spin_lock_irqsave(&hdq_data->hdq_spinlock, irqflags);
> -	/* clear interrupt flags via a dummy read */
> -	hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
> -	/* ISR loads it with new INT_STATUS */
> -	hdq_data->hdq_irqstatus =3D 0;
> -	spin_unlock_irqrestore(&hdq_data->hdq_spinlock, irqflags);
> -
> 	hdq_reg_out(hdq_data, OMAP_HDQ_TX_DATA, val);
>=20
> 	/* set the GO bit */
> @@ -191,6 +170,7 @@ static int hdq_write_byte(struct hdq_data =
*hdq_data, u8 val, u8 *status)
> 	}
>=20
> out:
> +	hdq_reset_irqstatus(hdq_data);
> 	return ret;
> }
>=20
> @@ -237,47 +217,11 @@ static void omap_w1_search_bus(void *_hdq, =
struct w1_master *master_dev,
> 	slave_found(master_dev, id);
> }
>=20
> -static int _omap_hdq_reset(struct hdq_data *hdq_data)
> -{
> -	int ret;
> -	u8 tmp_status;
> -
> -	hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
> -		    OMAP_HDQ_SYSCONFIG_SOFTRESET);
> -	/*
> -	 * Select HDQ/1W mode & enable clocks.
> -	 * It is observed that INT flags can't be cleared via a read and =
GO/INIT
> -	 * won't return to zero if interrupt is disabled. So we always =
enable
> -	 * interrupt.
> -	 */
> -	hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
> -		OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
> -		OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK);
> -
> -	/* wait for reset to complete */
> -	ret =3D hdq_wait_for_flag(hdq_data, OMAP_HDQ_SYSSTATUS,
> -		OMAP_HDQ_SYSSTATUS_RESETDONE, OMAP_HDQ_FLAG_SET, =
&tmp_status);
> -	if (ret)
> -		dev_dbg(hdq_data->dev, "timeout waiting HDQ reset, %x",
> -				tmp_status);
> -	else {
> -		hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
> -			OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
> -			OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK |
> -			hdq_data->mode);
> -		hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
> -			OMAP_HDQ_SYSCONFIG_AUTOIDLE);
> -	}
> -
> -	return ret;
> -}
> -
> /* Issue break pulse to the device */
> static int omap_hdq_break(struct hdq_data *hdq_data)
> {
> 	int ret =3D 0;
> 	u8 tmp_status;
> -	unsigned long irqflags;
>=20
> 	ret =3D mutex_lock_interruptible(&hdq_data->hdq_mutex);
> 	if (ret < 0) {
> @@ -286,13 +230,6 @@ static int omap_hdq_break(struct hdq_data =
*hdq_data)
> 		goto rtn;
> 	}
>=20
> -	spin_lock_irqsave(&hdq_data->hdq_spinlock, irqflags);
> -	/* clear interrupt flags via a dummy read */
> -	hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
> -	/* ISR loads it with new INT_STATUS */
> -	hdq_data->hdq_irqstatus =3D 0;
> -	spin_unlock_irqrestore(&hdq_data->hdq_spinlock, irqflags);
> -
> 	/* set the INIT and GO bit */
> 	hdq_reg_merge(hdq_data, OMAP_HDQ_CTRL_STATUS,
> 		OMAP_HDQ_CTRL_STATUS_INITIALIZATION | =
OMAP_HDQ_CTRL_STATUS_GO,
> @@ -341,6 +278,7 @@ static int omap_hdq_break(struct hdq_data =
*hdq_data)
> 			" return to zero, %x", tmp_status);
>=20
> out:
> +	hdq_reset_irqstatus(hdq_data);
> 	mutex_unlock(&hdq_data->hdq_mutex);
> rtn:
> 	return ret;
> @@ -357,7 +295,7 @@ static int hdq_read_byte(struct hdq_data =
*hdq_data, u8 *val)
> 		goto rtn;
> 	}
>=20
> -	if (!hdq_data->hdq_usecount) {
> +	if (pm_runtime_suspended(hdq_data->dev)) {
> 		ret =3D -EINVAL;
> 		goto out;
> 	}
> @@ -388,86 +326,13 @@ static int hdq_read_byte(struct hdq_data =
*hdq_data, u8 *val)
> 	/* the data is ready. Read it in! */
> 	*val =3D hdq_reg_in(hdq_data, OMAP_HDQ_RX_DATA);
> out:
> +	hdq_reset_irqstatus(hdq_data);
> 	mutex_unlock(&hdq_data->hdq_mutex);
> rtn:
> 	return ret;
>=20
> }
>=20
> -/* Enable clocks and set the controller to HDQ/1W mode */
> -static int omap_hdq_get(struct hdq_data *hdq_data)
> -{
> -	int ret =3D 0;
> -
> -	ret =3D mutex_lock_interruptible(&hdq_data->hdq_mutex);
> -	if (ret < 0) {
> -		ret =3D -EINTR;
> -		goto rtn;
> -	}
> -
> -	if (OMAP_HDQ_MAX_USER =3D=3D hdq_data->hdq_usecount) {
> -		dev_dbg(hdq_data->dev, "attempt to exceed the max use =
count");
> -		ret =3D -EINVAL;
> -		goto out;
> -	} else {
> -		hdq_data->hdq_usecount++;
> -		try_module_get(THIS_MODULE);
> -		if (1 =3D=3D hdq_data->hdq_usecount) {
> -
> -			pm_runtime_get_sync(hdq_data->dev);
> -
> -			/* make sure HDQ/1W is out of reset */
> -			if (!(hdq_reg_in(hdq_data, OMAP_HDQ_SYSSTATUS) &
> -				OMAP_HDQ_SYSSTATUS_RESETDONE)) {
> -				ret =3D _omap_hdq_reset(hdq_data);
> -				if (ret)
> -					/* back up the count */
> -					hdq_data->hdq_usecount--;
> -			} else {
> -				/* select HDQ/1W mode & enable clocks */
> -				hdq_reg_out(hdq_data, =
OMAP_HDQ_CTRL_STATUS,
> -					OMAP_HDQ_CTRL_STATUS_CLOCKENABLE =
|
> -					=
OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK |
> -					hdq_data->mode);
> -				hdq_reg_out(hdq_data, =
OMAP_HDQ_SYSCONFIG,
> -					OMAP_HDQ_SYSCONFIG_NOIDLE);
> -				hdq_reg_in(hdq_data, =
OMAP_HDQ_INT_STATUS);
> -			}
> -		}
> -	}
> -
> -out:
> -	mutex_unlock(&hdq_data->hdq_mutex);
> -rtn:
> -	return ret;
> -}
> -
> -/* Disable clocks to the module */
> -static int omap_hdq_put(struct hdq_data *hdq_data)
> -{
> -	int ret =3D 0;
> -
> -	ret =3D mutex_lock_interruptible(&hdq_data->hdq_mutex);
> -	if (ret < 0)
> -		return -EINTR;
> -
> -	hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
> -		    OMAP_HDQ_SYSCONFIG_AUTOIDLE);
> -	if (0 =3D=3D hdq_data->hdq_usecount) {
> -		dev_dbg(hdq_data->dev, "attempt to decrement use count"
> -			" when it is zero");
> -		ret =3D -EINVAL;
> -	} else {
> -		hdq_data->hdq_usecount--;
> -		module_put(THIS_MODULE);
> -		if (0 =3D=3D hdq_data->hdq_usecount)
> -			pm_runtime_put_sync(hdq_data->dev);
> -	}
> -	mutex_unlock(&hdq_data->hdq_mutex);
> -
> -	return ret;
> -}
> -
> /*
>  * W1 triplet callback function - used for searching ROM addresses.
>  * Registered only when controller is in 1-wire mode.
> @@ -482,7 +347,12 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
> 		  OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK;
> 	u8 mask =3D ctrl | OMAP_HDQ_CTRL_STATUS_DIR;
>=20
> -	omap_hdq_get(_hdq);
> +	err =3D pm_runtime_get_sync(hdq_data->dev);
> +	if (err < 0) {
> +		pm_runtime_put_noidle(hdq_data->dev);
> +
> +		return err;
> +	}
>=20
> 	err =3D mutex_lock_interruptible(&hdq_data->hdq_mutex);
> 	if (err < 0) {
> @@ -490,7 +360,6 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
> 		goto rtn;
> 	}
>=20
> -	hdq_data->hdq_irqstatus =3D 0;
> 	/* read id_bit */
> 	hdq_reg_merge(_hdq, OMAP_HDQ_CTRL_STATUS,
> 		      ctrl | OMAP_HDQ_CTRL_STATUS_DIR, mask);
> @@ -504,7 +373,9 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
> 	}
> 	id_bit =3D (hdq_reg_in(_hdq, OMAP_HDQ_RX_DATA) & 0x01);
>=20
> -	hdq_data->hdq_irqstatus =3D 0;
> +	/* Must clear irqstatus for another RXCOMPLETE interrupt */
> +	hdq_reset_irqstatus(hdq_data);
> +
> 	/* read comp_bit */
> 	hdq_reg_merge(_hdq, OMAP_HDQ_CTRL_STATUS,
> 		      ctrl | OMAP_HDQ_CTRL_STATUS_DIR, mask);
> @@ -547,18 +418,33 @@ static u8 omap_w1_triplet(void *_hdq, u8 bdir)
> 		      OMAP_HDQ_CTRL_STATUS_SINGLE);
>=20
> out:
> +	hdq_reset_irqstatus(hdq_data);
> 	mutex_unlock(&hdq_data->hdq_mutex);
> rtn:
> -	omap_hdq_put(_hdq);
> +	pm_runtime_mark_last_busy(hdq_data->dev);
> +	pm_runtime_put_autosuspend(hdq_data->dev);
> +
> 	return ret;
> }
>=20
> /* reset callback */
> static u8 omap_w1_reset_bus(void *_hdq)
> {
> -	omap_hdq_get(_hdq);
> -	omap_hdq_break(_hdq);
> -	omap_hdq_put(_hdq);
> +	struct hdq_data *hdq_data =3D _hdq;
> +	int err;
> +
> +	err =3D pm_runtime_get_sync(hdq_data->dev);
> +	if (err < 0) {
> +		pm_runtime_put_noidle(hdq_data->dev);
> +
> +		return err;
> +	}
> +
> +	omap_hdq_break(hdq_data);
> +
> +	pm_runtime_mark_last_busy(hdq_data->dev);
> +	pm_runtime_put_autosuspend(hdq_data->dev);
> +
> 	return 0;
> }
>=20
> @@ -569,37 +455,19 @@ static u8 omap_w1_read_byte(void *_hdq)
> 	u8 val =3D 0;
> 	int ret;
>=20
> -	/* First write to initialize the transfer */
> -	if (hdq_data->init_trans =3D=3D 0)
> -		omap_hdq_get(hdq_data);
> +	ret =3D pm_runtime_get_sync(hdq_data->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(hdq_data->dev);
>=20
> -	ret =3D hdq_read_byte(hdq_data, &val);
> -	if (ret) {
> -		ret =3D mutex_lock_interruptible(&hdq_data->hdq_mutex);
> -		if (ret < 0) {
> -			dev_dbg(hdq_data->dev, "Could not acquire =
mutex\n");
> -			return -EINTR;
> -		}
> -		hdq_data->init_trans =3D 0;
> -		mutex_unlock(&hdq_data->hdq_mutex);
> -		omap_hdq_put(hdq_data);
> 		return -1;
> 	}
>=20
> -	hdq_disable_interrupt(hdq_data, OMAP_HDQ_CTRL_STATUS,
> -			      ~OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK);
> +	ret =3D hdq_read_byte(hdq_data, &val);
> +	if (ret)
> +		ret =3D -1;
>=20
> -	/* Write followed by a read, release the module */
> -	if (hdq_data->init_trans) {
> -		ret =3D mutex_lock_interruptible(&hdq_data->hdq_mutex);
> -		if (ret < 0) {
> -			dev_dbg(hdq_data->dev, "Could not acquire =
mutex\n");
> -			return -EINTR;
> -		}
> -		hdq_data->init_trans =3D 0;
> -		mutex_unlock(&hdq_data->hdq_mutex);
> -		omap_hdq_put(hdq_data);
> -	}
> +	pm_runtime_mark_last_busy(hdq_data->dev);
> +	pm_runtime_put_autosuspend(hdq_data->dev);
>=20
> 	return val;
> }
> @@ -611,9 +479,12 @@ static void omap_w1_write_byte(void *_hdq, u8 =
byte)
> 	int ret;
> 	u8 status;
>=20
> -	/* First write to initialize the transfer */
> -	if (hdq_data->init_trans =3D=3D 0)
> -		omap_hdq_get(hdq_data);
> +	ret =3D pm_runtime_get_sync(hdq_data->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(hdq_data->dev);
> +
> +		return;
> +	}
>=20
> 	/*
> 	 * We need to reset the slave before
> @@ -623,31 +494,15 @@ static void omap_w1_write_byte(void *_hdq, u8 =
byte)
> 	if (byte =3D=3D W1_SKIP_ROM)
> 		omap_hdq_break(hdq_data);
>=20
> -	ret =3D mutex_lock_interruptible(&hdq_data->hdq_mutex);
> -	if (ret < 0) {
> -		dev_dbg(hdq_data->dev, "Could not acquire mutex\n");
> -		return;
> -	}
> -	hdq_data->init_trans++;
> -	mutex_unlock(&hdq_data->hdq_mutex);
> -
> 	ret =3D hdq_write_byte(hdq_data, byte, &status);
> 	if (ret < 0) {
> 		dev_dbg(hdq_data->dev, "TX failure:Ctrl status %x\n", =
status);
> -		return;
> +		goto out_err;
> 	}
>=20
> -	/* Second write, data transferred. Release the module */
> -	if (hdq_data->init_trans > 1) {
> -		omap_hdq_put(hdq_data);
> -		ret =3D mutex_lock_interruptible(&hdq_data->hdq_mutex);
> -		if (ret < 0) {
> -			dev_dbg(hdq_data->dev, "Could not acquire =
mutex\n");
> -			return;
> -		}
> -		hdq_data->init_trans =3D 0;
> -		mutex_unlock(&hdq_data->hdq_mutex);
> -	}
> +out_err:
> +	pm_runtime_mark_last_busy(hdq_data->dev);
> +	pm_runtime_put_autosuspend(hdq_data->dev);
> }
>=20
> static struct w1_bus_master omap_w1_master =3D {
> @@ -656,6 +511,35 @@ static struct w1_bus_master omap_w1_master =3D {
> 	.reset_bus	=3D omap_w1_reset_bus,
> };
>=20
> +static int __maybe_unused omap_hdq_runtime_suspend(struct device =
*dev)
> +{
> +	struct hdq_data *hdq_data =3D dev_get_drvdata(dev);
> +
> +	hdq_reg_out(hdq_data, 0, hdq_data->mode);
> +	hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused omap_hdq_runtime_resume(struct device *dev)
> +{
> +	struct hdq_data *hdq_data =3D dev_get_drvdata(dev);
> +
> +	/* select HDQ/1W mode & enable clocks */
> +	hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
> +		    OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
> +		    OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK |
> +		    hdq_data->mode);
> +	hdq_reg_in(hdq_data, OMAP_HDQ_INT_STATUS);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops omap_hdq_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(omap_hdq_runtime_suspend,
> +			   omap_hdq_runtime_resume, NULL)
> +};
> +
> static int omap_hdq_probe(struct platform_device *pdev)
> {
> 	struct device *dev =3D &pdev->dev;
> @@ -677,23 +561,27 @@ static int omap_hdq_probe(struct platform_device =
*pdev)
> 	if (IS_ERR(hdq_data->hdq_base))
> 		return PTR_ERR(hdq_data->hdq_base);
>=20
> -	hdq_data->hdq_usecount =3D 0;
> -	hdq_data->rrw =3D 0;
> 	mutex_init(&hdq_data->hdq_mutex);
>=20
> +	ret =3D of_property_read_string(pdev->dev.of_node, "ti,mode", =
&mode);
> +	if (ret < 0 || !strcmp(mode, "hdq")) {
> +		hdq_data->mode =3D 0;
> +		omap_w1_master.search =3D omap_w1_search_bus;
> +	} else {
> +		hdq_data->mode =3D 1;
> +		omap_w1_master.triplet =3D omap_w1_triplet;
> +	}
> +
> 	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 300);
> 	ret =3D pm_runtime_get_sync(&pdev->dev);
> 	if (ret < 0) {
> +		pm_runtime_put_noidle(&pdev->dev);
> 		dev_dbg(&pdev->dev, "pm_runtime_get_sync failed\n");
> 		goto err_w1;
> 	}
>=20
> -	ret =3D _omap_hdq_reset(hdq_data);
> -	if (ret) {
> -		dev_dbg(&pdev->dev, "reset failed\n");
> -		goto err_irq;
> -	}
> -
> 	rev =3D hdq_reg_in(hdq_data, OMAP_HDQ_REVISION);
> 	dev_info(&pdev->dev, "OMAP HDQ Hardware Rev %c.%c. Driver in %s =
mode\n",
> 		(rev >> 4) + '0', (rev & 0x0f) + '0', "Interrupt");
> @@ -715,16 +603,8 @@ static int omap_hdq_probe(struct platform_device =
*pdev)
>=20
> 	omap_hdq_break(hdq_data);
>=20
> -	pm_runtime_put_sync(&pdev->dev);
> -
> -	ret =3D of_property_read_string(pdev->dev.of_node, "ti,mode", =
&mode);
> -	if (ret < 0 || !strcmp(mode, "hdq")) {
> -		hdq_data->mode =3D 0;
> -		omap_w1_master.search =3D omap_w1_search_bus;
> -	} else {
> -		hdq_data->mode =3D 1;
> -		omap_w1_master.triplet =3D omap_w1_triplet;
> -	}
> +	pm_runtime_mark_last_busy(&pdev->dev);
> +	pm_runtime_put_autosuspend(&pdev->dev);
>=20
> 	omap_w1_master.data =3D hdq_data;
>=20
> @@ -739,6 +619,7 @@ static int omap_hdq_probe(struct platform_device =
*pdev)
> err_irq:
> 	pm_runtime_put_sync(&pdev->dev);
> err_w1:
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> 	pm_runtime_disable(&pdev->dev);
>=20
> 	return ret;
> @@ -746,23 +627,19 @@ static int omap_hdq_probe(struct platform_device =
*pdev)
>=20
> static int omap_hdq_remove(struct platform_device *pdev)
> {
> -	struct hdq_data *hdq_data =3D platform_get_drvdata(pdev);
> +	int active;
>=20
> -	mutex_lock(&hdq_data->hdq_mutex);
> -
> -	if (hdq_data->hdq_usecount) {
> -		dev_dbg(&pdev->dev, "removed when use count is not =
zero\n");
> -		mutex_unlock(&hdq_data->hdq_mutex);
> -		return -EBUSY;
> -	}
> +	active =3D pm_runtime_get_sync(&pdev->dev);
> +	if (active < 0)
> +		pm_runtime_put_noidle(&pdev->dev);
>=20
> -	mutex_unlock(&hdq_data->hdq_mutex);
> +	w1_remove_master_device(&omap_w1_master);
>=20
> -	/* remove module dependency */
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	if (active >=3D 0)
> +		pm_runtime_put_sync(&pdev->dev);
> 	pm_runtime_disable(&pdev->dev);
>=20
> -	w1_remove_master_device(&omap_w1_master);
> -
> 	return 0;
> }
>=20
> @@ -779,6 +656,7 @@ static struct platform_driver omap_hdq_driver =3D =
{
> 	.driver =3D {
> 		.name =3D	"omap_hdq",
> 		.of_match_table =3D omap_hdq_dt_ids,
> +		.pm =3D &omap_hdq_pm_ops,
> 	},
> };
> module_platform_driver(omap_hdq_driver);
> --=20
> 2.24.1

