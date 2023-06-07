Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97D9725684
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 09:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234667AbjFGH4B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 03:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbjFGH4A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 03:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2555E173A
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 00:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686124516;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zrMzVIVwuoeUQwH5hpliW2Jq51XgxuMBmmo9TGjEBeo=;
        b=dQ+LGMm3qhCBheOFOJsgUvhyj/4bCJKIG1eoZQa+lHQu8F7AP+p72iFmSAF+f/v56LzgIF
        maiOiEihhXCvhi14r+WGY6cb3OVmZc+0MRQFnDGmTdBFxyFIsK5AAeVburilz9z/YVAIGl
        8BLPkTUt6sWqQGMudZ9d6CWl4jeyVqU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-M4ufQvUAP3SulYATOFHLVg-1; Wed, 07 Jun 2023 03:55:15 -0400
X-MC-Unique: M4ufQvUAP3SulYATOFHLVg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4f62d8e527bso1829801e87.1
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 00:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686124513; x=1688716513;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrMzVIVwuoeUQwH5hpliW2Jq51XgxuMBmmo9TGjEBeo=;
        b=lhvCOuT/AePE0PokEbLIBtOD+LYq5yvV090c5LD6TnEgmXjqdLf5AjR0B9/neMScEw
         +L3HtR8NqzP3LXCrt0XCvcZMQ0gMmKZKG4gSyGheiZxnKcjoT6sMCZ8ujU3Vsj2HNrcc
         UwMS4GbvjaiIcNdRu7NxMxcrKw3s8WnJyHGUI9/SDvQJDgL2xh3IfQm5o09N+8RUgA2F
         5uE8jvoVqg3J0GyKRAmbqOif3/0Zywu0Jk/U0VMiltWAYmZ5RLzuPBhqxs0yZVQXKQMV
         28tC3Tt0+lRzDB/TOkxsFxvvCFnDWye4x7S/x7zn2OQB5B2AGBmlsq+8Bgk30R80StO+
         3n+A==
X-Gm-Message-State: AC+VfDyOtaYkBGtXVopN3bEBK39d7RsjOj7cPqh6CZZMiShW4fr0Yjz6
        j1f3/t9zLYAmSoP/0PdQ1aRezSH6yZuycTVXAkpR18XdqTg+LZmixn0/9xxkWNHbML5nN4yhEot
        CbcYZ2VXon/rigKin3/QGYg==
X-Received: by 2002:ac2:5a19:0:b0:4f3:bb14:bd40 with SMTP id q25-20020ac25a19000000b004f3bb14bd40mr1643613lfn.36.1686124513740;
        Wed, 07 Jun 2023 00:55:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5iJQ/YOY5BYJYpCuij2Dk8TuMWnzRrrUQf5oe61hk5gDfo5VjRa0aD7EjgG4gko6svJeBZBA==
X-Received: by 2002:ac2:5a19:0:b0:4f3:bb14:bd40 with SMTP id q25-20020ac25a19000000b004f3bb14bd40mr1643602lfn.36.1686124513442;
        Wed, 07 Jun 2023 00:55:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z9-20020a5d4d09000000b0030e5c8d55f2sm480065wrt.6.2023.06.07.00.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:55:13 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 07/30] fbdev/aty128fb: Use hardware device as backlight
 parent
In-Reply-To: <20230605144812.15241-8-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-8-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 09:55:12 +0200
Message-ID: <87ttvjg10f.fsf@minerva.mail-host-address-is-not-set>
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

> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

