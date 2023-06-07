Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26B6C7271A7
	for <lists+linux-omap@lfdr.de>; Thu,  8 Jun 2023 00:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbjFGW23 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 18:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbjFGW21 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 18:28:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A5D270F
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 15:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686176761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=67Wr4HmC8kXtCL1x0dOeckxppNMmBntLK5uulGf1sqg=;
        b=AekziaHAIignG92673jxFyMXcUI1d4/KIOvy5KsCoxl69+j1GibQXF0/QR8Bmgk6X7CLQb
        h9RIYj0SjIxKbATzvAvbSPY4BNOpT0X2a7RETdhs9XSwv62eRyc+BQwZsnLQx1e4Lztee8
        qL/NcFhscxyKiwMHuv9j0W6qdBgUNGg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-npNzzJM1MBmafT_ps2DoLQ-1; Wed, 07 Jun 2023 18:22:46 -0400
X-MC-Unique: npNzzJM1MBmafT_ps2DoLQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f7f4dc6ec2so4150875e9.0
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 15:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686176565; x=1688768565;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67Wr4HmC8kXtCL1x0dOeckxppNMmBntLK5uulGf1sqg=;
        b=hXgbHIWI2Hof0pKdffi8K4RtF7VpnlwE5SuxdG2WQFWZgwNcLdTMYhuJtCF94AfH0J
         Bts4LQUh4FHeaExz3mur8JDU/UINh1ls3UY90dOuEZtOaoTzrZwIECl8FaaGmDudtzIa
         xspO+y4gXIDGaVQsGz5v7O91NS724HLbS7T8XUr3ts8sB0eCdjfVIYvyCfD1kLb5Poez
         Rqd2i7j9hLul70pP9RJ42DEJn/Kw1h8wL+763QQq9DpHSj4GwUv6lCZ81APEY0Ra0cau
         miYAT1tbH6Mc5NHDH9Hvy7ckdnMTkJDDrk9AAmqmnZdqDYMNFcDVhJkw5pRXUn/cosJ9
         eMpA==
X-Gm-Message-State: AC+VfDwvbWt33o+5YEnnqwJrlHmArLOFB9hRwz1fD9rcqJIOeV2bC4WZ
        Je2V3/2rUEkjwBHFaxMEVes/b2IVkauf932pQF/41WFrGXbmS/oMhRL6IPbuAJNbLBdJHLIrP0R
        2agfNwNtf5V+/wE+roFeGGw==
X-Received: by 2002:a1c:4c11:0:b0:3f7:26f8:4cd0 with SMTP id z17-20020a1c4c11000000b003f726f84cd0mr5570490wmf.16.1686176564941;
        Wed, 07 Jun 2023 15:22:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ74+KkyeYoTNHdtFgdPjs/ko5gB/9QwThWFkjR0/oU0p3+M7MfNC36MRsPeTiM50kMg9GLwXA==
X-Received: by 2002:a1c:4c11:0:b0:3f7:26f8:4cd0 with SMTP id z17-20020a1c4c11000000b003f726f84cd0mr5570479wmf.16.1686176564616;
        Wed, 07 Jun 2023 15:22:44 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v6-20020a7bcb46000000b003f6028a4c85sm3342086wmj.16.2023.06.07.15.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 15:22:44 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Steve Glendinning <steve.glendinning@shawell.net>
Subject: Re: [PATCH 22/30] fbdev/smscufx: Detect registered fb_info from
 refcount
In-Reply-To: <20230605144812.15241-23-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-23-tzimmermann@suse.de>
Date:   Thu, 08 Jun 2023 00:22:43 +0200
Message-ID: <87edmmewuk.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Detect registered instances of fb_info by reading the reference
> counter from struct fb_info.read. Avoids looking at the dev field
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Steve Glendinning <steve.glendinning@shawell.net>
> ---
>  drivers/video/fbdev/smscufx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
> index 17cec62cc65d..adb2b1fe8383 100644
> --- a/drivers/video/fbdev/smscufx.c
> +++ b/drivers/video/fbdev/smscufx.c
> @@ -1496,7 +1496,7 @@ static int ufx_setup_modes(struct ufx_data *dev, struct fb_info *info,
>  	u8 *edid;
>  	int i, result = 0, tries = 3;
>  
> -	if (info->dev) /* only use mutex if info has been registered */
> +	if (refcount_read(&info->count)) /* only use mutex if info has been registered */

The struct fb_info .count refcount is protected by the registration_lock
mutex in register_framebuffer(). I think this operation isn't thread safe ?

But that was also the case for info->dev check, so I guess is OK and this
change is for an old fbdev driver anyways.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

