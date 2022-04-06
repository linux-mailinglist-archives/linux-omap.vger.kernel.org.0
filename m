Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF4FA4F6DC6
	for <lists+linux-omap@lfdr.de>; Thu,  7 Apr 2022 00:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiDFWUs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Apr 2022 18:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiDFWUq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Apr 2022 18:20:46 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97248E0981
        for <linux-omap@vger.kernel.org>; Wed,  6 Apr 2022 15:18:48 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k21so6532625lfe.4
        for <linux-omap@vger.kernel.org>; Wed, 06 Apr 2022 15:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pa4zANWlurn4lYqdOaK271sbJR8UEPePP6fbBE/J4kE=;
        b=N8R7MGFZWjnMhj7QOyKsDCjHayVa9WIX1gG7JLDq5BWaMaMIWspyUd7zrKaskWI7iC
         UHkr9hqQj6fvZShD3GNG1rtFrtFNWgRZrmqfuRBL3zI4bm9J6rJvyL1Y35cARYWg02ND
         J4EJr+VbOBaFdpQVUqbNIJEHPYyMBJLVy34lk52nSHEIUN8CdJa9EZwdNrNemn40p0OR
         TeusOiQSGCnTNN32rTsFwJ9PaPPU5Z2JYKbrVox9IzU+CY7xcvGR0+t2e89A8Zs5x2Yk
         de5f2vfcCioSdg8gyeyz9SVyO1jP6DJNIFc1TKWcH/3ZlVSy1aMQkCRBXR4HJQNJ/yyn
         jZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pa4zANWlurn4lYqdOaK271sbJR8UEPePP6fbBE/J4kE=;
        b=wr1SJ44n0bGzg7u+eCwacX7V1Js0JrIFZFG6HkudotkHLnel1/G06cIpQxcpXn5Rnj
         1Gnlak4nZKCND4Gau2nEamZQaiULFPxB/LJuFukLAW8hKjTVf7/fEwGKGhvBLFFz2oYs
         TBPC0MHEdBPMjc25wF6apTT+aWlOyK1BADd/mVhosgWn7chzar/7vTYgyKgr1dZWyFgu
         Y6E9u8+d002v+6CSiA9+xsDlIxaQuBkAq+wmgL3QcPXBqWGcAzN3zWJus077VlFVgesK
         w1a0qeON+EPG+IDxBl/6ChuA11q/QkgY7xJZITXpDkCD2pq8WqXqoSw465h7qfHAzS1U
         UcVQ==
X-Gm-Message-State: AOAM532ZiHHsMwm0zPRRTTXlTDjAXjVFqK+zrVlGvAmsrjYbAZMuXLcl
        ibvvNzGjDLAMsh6s1Q1e8RA=
X-Google-Smtp-Source: ABdhPJwHI8x+zuSmsxDgxAL5xnYDtATE8JRV4/uEdWX+YajahQyIksWC0vOdA/yzLTHf8y6BXoDJAg==
X-Received: by 2002:ac2:5119:0:b0:450:d4e7:99ca with SMTP id q25-20020ac25119000000b00450d4e799camr7259563lfb.95.1649283526734;
        Wed, 06 Apr 2022 15:18:46 -0700 (PDT)
Received: from dell.intranet (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id bu20-20020a056512169400b0043eaf37af75sm1967337lfb.199.2022.04.06.15.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 15:18:46 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mark Brown <broonie@kernel.org>,
        =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] ASoC: ti: osk5912: Make it CCF clk API compatible
Date:   Thu, 07 Apr 2022 00:18:45 +0200
Message-ID: <1908101.usQuhbGJ8B@dell>
In-Reply-To: <1fa386d7-2222-f12d-8a8f-c7be29b1c6d2@gmail.com>
References: <20220402120106.131118-1-jmkrzyszt@gmail.com> <1fa386d7-2222-f12d-8a8f-c7be29b1c6d2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Peter,

On Wednesday, 6 April 2022 21:57:34 CEST P=E9ter Ujfalusi wrote:
> Hi Janusz,
>=20
> On 02/04/2022 15:01, Janusz Krzysztofik wrote:
> > The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
> > supported by OMAP1 custom implementation of clock API.  However, non-CCF
> > stubs of those functions exist for use on such platforms until converted
> > to CCF.
> >=20
> > Update the driver to be compatible with CCF implementation of clock API.
> >=20
> > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > ---
> >  sound/soc/ti/osk5912.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
> > index 40e29dda7e7a..22da3b335e81 100644
> > --- a/sound/soc/ti/osk5912.c
> > +++ b/sound/soc/ti/osk5912.c
> > @@ -134,6 +134,10 @@ static int __init osk_soc_init(void)
> >  		goto err2;
> >  	}
> > =20
> > +	err =3D clk_prepare(tlv320aic23_mclk);
>=20
> would not make sense to change the clk_enable() to clk_prepare_enable()
> in osk_startup() and the clk_disable() to clk_disable_unprepare() in
> osk_shutdown() instead leaving the clock in prepared state as long as
> the driver is loaded?

OK, I can see the clk_prepare_enable() approach is more common than=20
separate clk_prepare() across the kernel code, and I have no arguments=20
against it in our case.  I'll submit v2 soon.

Thanks,
Janusz
 =20
>=20
> > +	if (err)
> > +		goto err3;
> > +
> >  	/*
> >  	 * Configure 12 MHz output on MCLK.
> >  	 */
> > @@ -142,7 +146,7 @@ static int __init osk_soc_init(void)
> >  		if (clk_set_rate(tlv320aic23_mclk, CODEC_CLOCK)) {
> >  			printk(KERN_ERR "Cannot set MCLK for AIC23 CODEC\n");
> >  			err =3D -ECANCELED;
> > -			goto err3;
> > +			goto err4;
> >  		}
> >  	}
> > =20
> > @@ -151,6 +155,8 @@ static int __init osk_soc_init(void)
> > =20
> >  	return 0;
> > =20
> > +err4:
> > +	clk_unprepare(tlv320aic23_mclk);
> >  err3:
> >  	clk_put(tlv320aic23_mclk);
> >  err2:
> > @@ -164,6 +170,7 @@ static int __init osk_soc_init(void)
> > =20
> >  static void __exit osk_soc_exit(void)
> >  {
> > +	clk_unprepare(tlv320aic23_mclk);
> >  	clk_put(tlv320aic23_mclk);
> >  	platform_device_unregister(osk_snd_device);
> >  }
>=20
>=20




