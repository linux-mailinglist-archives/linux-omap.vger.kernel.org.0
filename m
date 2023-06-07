Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E886725631
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 09:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234478AbjFGHp5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 03:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239606AbjFGHp0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 03:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7321FF2
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 00:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686123740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VCpM3n9uxiNBqWYphesbEdJfBdCBdNVjlNpr9KooViE=;
        b=gZ231ichOXO2PsDCf8N78v1GZF4IuEVoChlFzGhTho8vPdadPGv6BCU3+HNWnxwld7AnSZ
        b37cO1SM9r8OtfjqLmTYk4i8qErdpRr888h3ytpxr8QKrQPgKDU41i/QcWZsNvW3/IteJH
        awYL3CHNBeBASGhvcg0DRLFpJKnOZSA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-btfsi15ZOM--bdZjjJ0P_A-1; Wed, 07 Jun 2023 03:42:19 -0400
X-MC-Unique: btfsi15ZOM--bdZjjJ0P_A-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30ae4ed92eeso3067064f8f.1
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 00:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123738; x=1688715738;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCpM3n9uxiNBqWYphesbEdJfBdCBdNVjlNpr9KooViE=;
        b=boJq0DEfBk/tySlTKvSFFm5M6/p37AaZ6yGP9X50d/4qAFmeLgXYknDnf/NFULD5Ro
         PeiFL28R0fwE6hcrccy73wyszwRylSKX8hzQWW3RKw1sPS1uBxUTwoDSsMFLJKjYuzgP
         nFj4t0iE8SjNpE4tfI/0cgRglcLvQ87AS+15qh3FYC8/vyWppy+mJSZC8OYsAssauSmb
         TUvCUAYzrOIBm7Cftf5esGFQoahjqfojgosMTp3ObiQ7E7LtbVUEfQj64PsRC4OILUMk
         5bXytPCv5dlKL1RvJy6U0s1xPcKLMWo4WZT8my260IeI/sr8AE94Xi3hiMxicBzl7q9w
         9k2g==
X-Gm-Message-State: AC+VfDwQnFEXDhkL42/0NpHElrafhesuWJNQSsOgw/5l8jGEaxG+docQ
        eaOQgj8ehGSXmUzhuQ+jH5yuFcuAjlv+3PWPwzAlp4GXNuI1WDmyw32/A//fPJ2Z38BbNjKuM3P
        7j8cTHufa/4+ONnKv1YRP3A==
X-Received: by 2002:adf:eb88:0:b0:30e:45ac:810e with SMTP id t8-20020adfeb88000000b0030e45ac810emr3734963wrn.36.1686123738653;
        Wed, 07 Jun 2023 00:42:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5KZwfGmENtFpHBv/PbHt1rJPnSSY7XTJGSBoIFHGMz6zbW+M0/3e5qcpQ+OgRWGlPIuGCuTA==
X-Received: by 2002:adf:eb88:0:b0:30e:45ac:810e with SMTP id t8-20020adfeb88000000b0030e45ac810emr3734950wrn.36.1686123738508;
        Wed, 07 Jun 2023 00:42:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z13-20020a056000110d00b003047dc162f7sm14752394wrw.67.2023.06.07.00.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:42:18 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 06/30] fbdev/aty128fb: Reorder backlight and framebuffer
 init/cleanup
In-Reply-To: <20230605144812.15241-7-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-7-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 09:42:17 +0200
Message-ID: <87wn0fg1ly.fsf@minerva.mail-host-address-is-not-set>
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

> The driver's backlight code requires the framebuffer to be
> registered. Therefore reorder the init and cleanup calls for
> both data structures.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

