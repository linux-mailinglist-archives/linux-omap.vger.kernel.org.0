Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9769972593E
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 11:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238971AbjFGJDF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 05:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238874AbjFGJCn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 05:02:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C832120
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686128422;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ha3iiTWVECujH5I3jqgNS4AW7y6robxFbsBFSl574Yk=;
        b=aXSayM6ds2nRrTCS+Qcapo0hKe5xZcRkKIHsMW37HxsvqTFTnOaP5WEfUGSBIZzdIkPjlt
        9rLkbOfIAJzHzgOkZD4+AOEyUvO2djlHS2jt1vpj/oju5fNURqeU014t5/EPdXId48NiEj
        dTn5ytekCwdAMqymS9twHpBMLw9aU3Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467--4xNBfASOdqV2HMKHbKVpg-1; Wed, 07 Jun 2023 05:00:21 -0400
X-MC-Unique: -4xNBfASOdqV2HMKHbKVpg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30af00323b0so3227121f8f.2
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 02:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128420; x=1688720420;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha3iiTWVECujH5I3jqgNS4AW7y6robxFbsBFSl574Yk=;
        b=ibzDiOICPCK/baqtqGQWMb+BlHwzGG1Yt69OYu4OVKkmb9Hh2/682YIC6SHtumrdhF
         i1STF4vlbw+xKSmUohVNEwHcFD+Ubvb4r86dKRd9Lk8YdloJNqDXvnlVzQvWzO8yqXIm
         uahCABh/WBJVA77jqphNjpjSX8wfQlxLHaIvNIoiZOzfPdUwZg1OanhEIhds4oOI8mxH
         7DbitUqsWL2nhOJQ4s7YX2pcoefeKC6NS9q6CLohrujTcm7wrq2XKnzeEOSTqkKChBGc
         F6Q+rjbraQMznbwCx+tM4xMwCmAwil8ljXueCqzyFeBPD1b4dCMdEPfV+cavxNnvz/pp
         YWeg==
X-Gm-Message-State: AC+VfDwpJGE/apYhvXMYVPHldMbrHZoflnNpb6e2b7hUb9R001JJ4K7U
        tSiKKo142EnAy207cDPTraEMhTGMjBETRavUO/T03RZW8hk4rDp27MnBp7vCgEsWVLMTF8kup3Y
        HHG4sGhRfniPSopJSXbEPBA==
X-Received: by 2002:a05:6000:503:b0:2ef:ba4f:c821 with SMTP id a3-20020a056000050300b002efba4fc821mr3492628wrf.36.1686128420034;
        Wed, 07 Jun 2023 02:00:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6K7G3bt0VUByq7FRT2lQ5ZRsRDVTyfbQ/GNM/0/foGN7SQ7frEuHnXH19X2JYBcLKX3c3pJQ==
X-Received: by 2002:a05:6000:503:b0:2ef:ba4f:c821 with SMTP id a3-20020a056000050300b002efba4fc821mr3492608wrf.36.1686128419772;
        Wed, 07 Jun 2023 02:00:19 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id e12-20020a5d594c000000b0030ae16132besm14801751wri.12.2023.06.07.02.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:00:19 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 11/30] fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
In-Reply-To: <20230605144812.15241-12-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-12-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 11:00:18 +0200
Message-ID: <87ilbzfxzx.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Do not assing the Linux device to struct fb_info.dev. The call to
> register_framebuffer() initializes the field to the fbdev device.
> Drivers should not override its value.
>
> Fixes a bug where the driver incorrectly decreases the hardware
> device's reference counter and leaks the fbdev device.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

