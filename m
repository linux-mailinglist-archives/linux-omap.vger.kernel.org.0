Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 759427271A1
	for <lists+linux-omap@lfdr.de>; Thu,  8 Jun 2023 00:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbjFGW0c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 18:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232996AbjFGW0Y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 18:26:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F7A26B9
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 15:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686176612;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=m3wnM605gKMmCudt2hcJJr2EFLF4uSnPgF/R0Xs7/Z4=;
        b=QxYESGbPrg6v7UaUmB28uh4IUC/ebnzDw7xfaX5ErD+eBM5aDoBXm5NYFcTaWrffaVZyv9
        AxWEU5aHUUcIwFGtysd7UnD9RyLMPEUBBHDGQ8ujGlSZoz3F/PSPMDc7mHdNERGxPZcpLU
        n5f+UBvHLzcf3oeZ2OEenaO5TL5teSo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-CZoynmdqPsCcZzm7UzyX0g-1; Wed, 07 Jun 2023 18:23:30 -0400
X-MC-Unique: CZoynmdqPsCcZzm7UzyX0g-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f7f2d9a660so4378985e9.2
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 15:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686176609; x=1688768609;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3wnM605gKMmCudt2hcJJr2EFLF4uSnPgF/R0Xs7/Z4=;
        b=Hw7gDxlGKuwKzGBU3qKNxBBudNei2BqhJ55SgZq9yqKl6oi8PgyrXXG3QX6unmGUS6
         SP/l0tpcryBi568tcZG8sF5GETv5f013N4u3FiR1CzxC4tDJSyg7YQI9LuiPW8G+wufI
         Ucf35arTQ99+vM4JsC/z1WwwV/++BoYEKuHSNlDfdqvyc5Q7jZKg3fbiKYT7qVG0xW0I
         vi8DV4gWRQhPuI+vtSSyLaIJOGazkCZUMyzpi0mXapTXHCCFRZVDJOGrTML72ZrPefv/
         gJZps7OcxHVwTLtzhv4HXLgbHhlRKVJnwXM0AF7BraoHjUSqPgartQ5tv3mZJHS5Pvqf
         MvkA==
X-Gm-Message-State: AC+VfDz/BT60glz2osdi35O8Qq9KnHdv3jO3iIaUoHODLHRnAql7ZjfI
        zb5DzaaVS4i6rh1deZeuj5hbWm9+K8FZ894/rHSKpxdbsTplIUaaj7BxmYUntIisAQ74sSMWRcY
        j2rOMN6onsyI7iyOzvw8Lpw==
X-Received: by 2002:a05:600c:230c:b0:3f7:f4bc:ebf3 with SMTP id 12-20020a05600c230c00b003f7f4bcebf3mr1544748wmo.36.1686176609315;
        Wed, 07 Jun 2023 15:23:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46AO52oYq6hkZwI7LskizRRuqd6gfq8mv/AQFd6xOXiRAiGoamovfGXQJy96q8ipeUPGiuUw==
X-Received: by 2002:a05:600c:230c:b0:3f7:f4bc:ebf3 with SMTP id 12-20020a05600c230c00b003f7f4bcebf3mr1544739wmo.36.1686176608968;
        Wed, 07 Jun 2023 15:23:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d10-20020a1c730a000000b003f42158288dsm3313271wmb.20.2023.06.07.15.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 15:23:28 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 23/30] fbdev/tdfxfb: Set i2c adapter parent to hardware
 device
In-Reply-To: <20230605144812.15241-24-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-24-tzimmermann@suse.de>
Date:   Thu, 08 Jun 2023 00:23:27 +0200
Message-ID: <87bkhqewtc.fsf@minerva.mail-host-address-is-not-set>
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

> Use the 3dfx hardware device from the Linux device hierarchy as
> parent device of the i2c adapter. Aligns the driver with the rest
> of the codebase and prepares fbdev for making struct fb_info.dev
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

