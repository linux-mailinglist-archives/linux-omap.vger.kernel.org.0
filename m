Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE44372568F
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 09:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbjFGH4b (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 03:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235154AbjFGH4a (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 03:56:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C449D10DE
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 00:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686124542;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tzwKDEeExwlnpVxIio+gh6QukNcWAFoM0lG5LiuVXys=;
        b=HuuBJK36EksWvyRjsptVOhvlMnoybeuJ8PR+wNYlrY6OfsvKQkn83mi+zYyhRu8xsu0SYm
        u4CDjKd/+HDRfTA8ZmTW9qKT9lvVjIlE/jzKwYwy9LqcBH7SjbuynzBzIM/CQ0jz0pdnup
        3tfbff9ojREJoeWKzoIqtkD0dFIMSwM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-tZbqn4iAM4iiDkqxMpAcSg-1; Wed, 07 Jun 2023 03:55:40 -0400
X-MC-Unique: tZbqn4iAM4iiDkqxMpAcSg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f7ecc15771so1647325e9.1
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 00:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686124539; x=1688716539;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzwKDEeExwlnpVxIio+gh6QukNcWAFoM0lG5LiuVXys=;
        b=iLYyYsWLROZiZlugGsTEBf8hg1NsrcRXPZIRl2q/fN7/8kofVzzZAcPZtSJz+jAo0h
         qUT2VozU555cq55Hi4tXv1CMvWHyRcIHxIvojRp0WSJH2qJoWNNZ28gyN66IDEMLheDt
         haZ0G4BTer48WejS2XuE9GTiHAu//9KLvxLpx6nBV5P4Byov92SgJKY0SLm80CZ/CkhT
         4V+V/lZb6C1SrpR/x/hkt5cYAw+DyK5f52yLuSSXkGn5frJ5vRGunRVG359yIuMC+jVE
         uCMnkV8LB8Whi24LcBvafxbd3GEGylQrkn25ssHKtDvdkjP+BM9Xonbv70aJcoSeN4WW
         QSiQ==
X-Gm-Message-State: AC+VfDzQlcLsrhBPJEG6GKkcfGsGBm2ViVhxUJjoYQ7MDjyGe22wYYjx
        f58iYItrvuvGxQQL+3MUY+YJUWe87WFzMBEP54bK7L9Szjq+/R/FFBTfYsPgko8NxnTQlOTpYdN
        2WPiQHWDZ07LQak7t1AwaLA==
X-Received: by 2002:a05:600c:b89:b0:3f7:3284:4e51 with SMTP id fl9-20020a05600c0b8900b003f732844e51mr8903488wmb.4.1686124539609;
        Wed, 07 Jun 2023 00:55:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XsE1MIBLkrKPsF0to0MXFrankIK5l3IfIsZWE8tI4gRDcEz1ZX1KmYbQPpdwp7XOKQIbPMQ==
X-Received: by 2002:a05:600c:b89:b0:3f7:3284:4e51 with SMTP id fl9-20020a05600c0b8900b003f732844e51mr8903472wmb.4.1686124539336;
        Wed, 07 Jun 2023 00:55:39 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j27-20020a05600c1c1b00b003f4283f5c1bsm6978981wms.2.2023.06.07.00.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:55:39 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 08/30] fbdev/broadsheetfb: Call device_remove_file()
 with hardware device
In-Reply-To: <20230605144812.15241-9-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-9-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 09:55:37 +0200
Message-ID: <87r0qng0zq.fsf@minerva.mail-host-address-is-not-set>
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

> Call device_remove_file() with the same device that has been used
> for device_create_file(), which is the hardware device stored in
> struct fb_info.device. Prepares fbdev for making struct fb_info.dev
> optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

