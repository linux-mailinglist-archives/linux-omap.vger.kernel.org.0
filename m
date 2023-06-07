Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4B797255E3
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 09:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234478AbjFGHhS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 03:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239158AbjFGHg1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 03:36:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E861BD3
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 00:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686123257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/4kkmKCd2wl5ncm7VdRIyhpSQ8IQY2Nc27kZwe+CQ6o=;
        b=LVSDFBfhdSkwtzPFG4sZRf/u9CdMuQsD1qYl45GW13luVcLOgJaPqGtOios0WeGXypjdHX
        xhzjS4QZSoTP3yY9V2S9iTDBAFb1FutBahNOlbpdk6bBtv+eBq267Al7chBOHpzBCvztS6
        ddizKXKW71efKcWF5I/mCGOkM1/lNbE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-oxLDNIinPGSukZcTloCjwA-1; Wed, 07 Jun 2023 03:34:16 -0400
X-MC-Unique: oxLDNIinPGSukZcTloCjwA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30ae4ed92eeso3063718f8f.1
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 00:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123255; x=1688715255;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/4kkmKCd2wl5ncm7VdRIyhpSQ8IQY2Nc27kZwe+CQ6o=;
        b=SEeyCWVot80K99hUPJKonOFgzMzJFnqrg2qzyp6AxzbO1dbjUTogsXH6GwXx0+/sJD
         MmnEDGTk0NJr8LMESu2NqQ+saMrILoEY3+++m9mPFJb9iFvB8J5hn3gzcZGkFo8yz0Kv
         ARtQNoAOJrZB8OJWShKQBWzWLT3vnzA6zMiQBB3qY/3/6J6FcQMV8h8rFJPLvLXJ0xYA
         2vapOgmOpMvIvsStiTAjhuhbqFdSwXPdwk2rp05kGtHe19CZX3Yyj8k0oU9DhgdynDtt
         lgxD3XKrNT6tJjI0LXqcIB5uZCEHxljDdDzyXTbu15Vy9MkvNPmafKGnnHklrBdA+l3U
         mBuw==
X-Gm-Message-State: AC+VfDy9SyHH0gXRdc6UF0qoizSB9HCDHVZ5qxxJJshgqV2afM6sH76S
        KzNswHmcQPJxYegLBWrdLKQ60JC35As+i68t9f9ZXO1rTtW2E6xQAWuIMWn3HL7XQesn5EsKuv3
        XsKshJmPdjOerjuxk8rAatg==
X-Received: by 2002:adf:de92:0:b0:2ef:bada:2f25 with SMTP id w18-20020adfde92000000b002efbada2f25mr3634435wrl.67.1686123255196;
        Wed, 07 Jun 2023 00:34:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5kwgjMr0fDuyCE+y4fhZTqJkSHNU6+Lw9lBuHow6MJ+hyLq4N+EQ2nCyTNeqeilySEFyk4bw==
X-Received: by 2002:adf:de92:0:b0:2ef:bada:2f25 with SMTP id w18-20020adfde92000000b002efbada2f25mr3634421wrl.67.1686123254876;
        Wed, 07 Jun 2023 00:34:14 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c028300b003f7eeec829asm1180357wmk.10.2023.06.07.00.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:34:14 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/30] backlight/bd6107: Compare against struct
 fb_info.device
In-Reply-To: <20230605144812.15241-2-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-2-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 09:34:14 +0200
Message-ID: <878rcvhgjt.fsf@minerva.mail-host-address-is-not-set>
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

> Struct bd6107_platform_data refers to a platform device within
> the Linux device hierarchy. The test in bd6107_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---

I agree with what was discussed in this thread, the check fix and rename
could be split in separate patches to make it easier to understand what
is changed. Regardless, feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

