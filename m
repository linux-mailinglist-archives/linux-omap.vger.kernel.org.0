Return-Path: <linux-omap+bounces-148-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 271ED808F9E
	for <lists+linux-omap@lfdr.de>; Thu,  7 Dec 2023 19:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7B4D281793
	for <lists+linux-omap@lfdr.de>; Thu,  7 Dec 2023 18:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77344D581;
	Thu,  7 Dec 2023 18:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="DPgOzsJ9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7DB1709;
	Thu,  7 Dec 2023 10:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9D6yq2B7q5erxZtOWDDLANO3cePB0ysAubAeqgYu7lo=; b=DPgOzsJ9E7g5mLIbHd9g3cMrob
	uLnVTIgGSePMGA4WfLnad4z97BohSy5Imr4aqmFDZGDtnmoB5YKfN0Q/EWgRJqONK02OIFXr/AnbN
	JWSkyfHHtU6BqmJ5SAT+p3czcN9EeZkEEkt7W+cug9c+jIOvy9eqjgi564DvPVgM8cTLLDI1Hz4jM
	14dbjeJRgFBX8Qy0Nn6h6Xltg84+92eamjJDQMrzlZntZ4kfeV19qtW22NX8xsxoHoVbX3+C6YsYi
	DmkWIuDG6Axb9vZjoUtBrT7cEVCgSeYjix/+9gNMNcrI7Iw/2Mqa+XyFeZaqFr+9ZywbfAAkA5cRh
	jMdczgYg==;
Received: from p200301077700c3001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:c300:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1rBIqP-0078w4-48; Thu, 07 Dec 2023 19:11:29 +0100
Date: Thu, 7 Dec 2023 19:11:26 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee@kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 2/6] twl-core: add power off implementation for
 twl603x
Message-ID: <20231207191126.2afb9d69@aktux>
In-Reply-To: <20231207171155.GG111411@google.com>
References: <20231203222903.343711-1-andreas@kemnade.info>
	<20231203222903.343711-3-andreas@kemnade.info>
	<20231207171155.GG111411@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 7 Dec 2023 17:11:55 +0000
Lee Jones <lee@kernel.org> wrote:

> On Sun, 03 Dec 2023, Andreas Kemnade wrote:
> 
> > If the system-power-controller property is there, enable power off.
> > Implementation is based on a Linux v3.0 vendor kernel.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  drivers/mfd/twl-core.c  | 28 ++++++++++++++++++++++++++++
> >  include/linux/mfd/twl.h |  1 +
> >  2 files changed, 29 insertions(+)
> > 
> > diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> > index 6e384a79e3418..f3982d18008d1 100644
> > --- a/drivers/mfd/twl-core.c
> > +++ b/drivers/mfd/twl-core.c
> > @@ -124,6 +124,11 @@
> >  #define TWL6030_BASEADD_RSV		0x0000
> >  #define TWL6030_BASEADD_ZERO		0x0000
> >  
> > +/* some fields in TWL6030_PHOENIX_DEV_ON */  
> 
> My preference is for proper grammar in comments please.
> 
> "Some"
> 
> What is TWL6030_PHOENIX_DEV_ON?  A register?
> 
yes, a register.

> > +#define TWL6030_APP_DEVOFF		BIT(0)
> > +#define TWL6030_CON_DEVOFF		BIT(1)
> > +#define TWL6030_MOD_DEVOFF		BIT(2)
> > +
> >  /* Few power values */
> >  #define R_CFG_BOOT			0x05
> >  
> > @@ -687,6 +692,20 @@ static void twl_remove(struct i2c_client *client)
> >  	twl_priv->ready = false;
> >  }
> >  
> > +static void twl6030_power_off(void)
> > +{
> > +	int err;
> > +	u8 val;
> > +
> > +	err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &val, TWL6030_PHOENIX_DEV_ON);
> > +	if (err)
> > +		return;
> > +
> > +	val |= TWL6030_APP_DEVOFF | TWL6030_CON_DEVOFF | TWL6030_MOD_DEVOFF;
> > +	twl_i2c_write_u8(TWL_MODULE_PM_MASTER, val, TWL6030_PHOENIX_DEV_ON);
> > +}
> > +
> > +
> >  static struct of_dev_auxdata twl_auxdata_lookup[] = {
> >  	OF_DEV_AUXDATA("ti,twl4030-gpio", 0, "twl4030-gpio", NULL),
> >  	{ /* sentinel */ },
> > @@ -852,6 +871,15 @@ twl_probe(struct i2c_client *client)
> >  			goto free;
> >  	}
> >  
> > +	if (twl_class_is_6030()) {  
> 
> Is this check required?
> 
Well, as we want to do something specific to 603x we need the check.

> > +		if (of_device_is_system_power_controller(node)) {  
> 
> Shouldn't this cover it?
> 
Well, in the twl4030 case there is another power off routine required.


> > +			if (!pm_power_off)
> > +				pm_power_off = twl6030_power_off;
> > +			else
> > +				dev_warn(&client->dev, "Poweroff callback already assigned\n");  
> 
> Can this happen?  Why would anyone care if it did?
> 
If system is correctly configured, then not. Well, I do not know about others
but I personally expect my devices to turn on after having them turned off
without significant battery loss and really turn off.
But if it is not the case, then having such warning messages would be an
early indication that something is really wrong.
I personally have been in a situation where two devices wanted to register
a power off handler. Order of device probing is random, so having such a 
message is a real good idea I think.

Regards,
Andreas

