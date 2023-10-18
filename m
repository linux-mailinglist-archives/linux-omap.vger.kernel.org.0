Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61C3C7CD661
	for <lists+linux-omap@lfdr.de>; Wed, 18 Oct 2023 10:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344208AbjJRI0s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Oct 2023 04:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235211AbjJRI0n (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Oct 2023 04:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB744F9
        for <linux-omap@vger.kernel.org>; Wed, 18 Oct 2023 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697617557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LjzSocfdAfDkrBURoH/UDEiTk7o5qnArVSGlXdT8TDY=;
        b=AvforaRYrDAGvrSUfuBGF4wHEkU0YEuddDWldbIDpvL8eNDLxDv1Xwu/n/LWtrWN2/l5HA
        ajURUL6Jag7GCYFNWpg3UXwBpD983IG20vcM/lzUGhpRl+U29DGnwjPRwIMoEclUNrpFX3
        +veuy5/53nuOo3eUs4dH0soEucE89b8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-a67rp-GMM5yt5wcYubdwoQ-1; Wed, 18 Oct 2023 04:25:45 -0400
X-MC-Unique: a67rp-GMM5yt5wcYubdwoQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3231fceb811so3934633f8f.2
        for <linux-omap@vger.kernel.org>; Wed, 18 Oct 2023 01:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697617544; x=1698222344;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LjzSocfdAfDkrBURoH/UDEiTk7o5qnArVSGlXdT8TDY=;
        b=i3ZBo2anfbGwLPIrGnCwK7+eLr3lFWN2rXNLhur6NlSMcgRNhNDLNdLEjEtatByZ+9
         1C5hVrQD6VD8YbQZFdAnSx0AtdYCha+P2dOMtTXpaObU24yau7w6hds5k8VnJ03uuvQS
         S4oY+dIfC/kM4Mn+V8DXW0HeLatz9Fz2nzBktM+9mc52ZwEAVK82fg2JnmegCZEb1o3i
         gar6PqGVJwK4OMdszIjHztUkAihn+bSUC9+T0rnNVIB0td3SsqTCkkQJLUSuJNgJ2ydS
         lYfoEAc5+Y0Y2UA4ckVtnGtKkmb+NhUdYePZUJIVCjZQLGzkRWKhXQY0QZp6aidVWbD1
         QiEw==
X-Gm-Message-State: AOJu0YyXw90cc99TAIKb63kelB0U7UQ+fc2StXLsZZDKyOtXJeTiLh7z
        pKmacZdvPrw5IptjHbr9/xMnILHpl+AVJCrVydd1Rex22Qnom0tvu+Be7NlGhH5WEFsOBrr2D5D
        x66YRSu45qPe/6cyGa8+xAg==
X-Received: by 2002:a5d:4c89:0:b0:32d:8094:f4c8 with SMTP id z9-20020a5d4c89000000b0032d8094f4c8mr3650289wrs.19.1697617544654;
        Wed, 18 Oct 2023 01:25:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa4Q8xItiTztaLFOsH4D6hLMKERtw9q396FzIJnVUMQIU6RTlte1VKHlDSYg+C3e5HZRfxSQ==
X-Received: by 2002:a5d:4c89:0:b0:32d:8094:f4c8 with SMTP id z9-20020a5d4c89000000b0032d8094f4c8mr3650275wrs.19.1697617544348;
        Wed, 18 Oct 2023 01:25:44 -0700 (PDT)
Received: from localhost (210.red-80-36-22.staticip.rima-tde.net. [80.36.22.210])
        by smtp.gmail.com with ESMTPSA id j14-20020adfea4e000000b0032d81837433sm1584752wrn.30.2023.10.18.01.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 01:25:44 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        sam@ravnborg.org, arnd@arndb.de, daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/46] fbdev: Init fb_ops with helpers for I/O memory
In-Reply-To: <20230927074722.6197-1-tzimmermann@suse.de>
References: <20230927074722.6197-1-tzimmermann@suse.de>
Date:   Wed, 18 Oct 2023 10:25:43 +0200
Message-ID: <877cnkqquw.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize struct fb_ops for drivers for hardware with framebuffers
> in I/O-memory ranges with the respective helper macros. Also select
> the appropriate Kconfig dependencies.
>
> The patchset is part of a larger effort to modularize the fbdev core
> and make it more adaptable. Most of these drivers do not initialize
> the fb_read, fb_write and fb_mmap callbacks in fb_ops. By leaving the
> callback pointers to NULL, they rely on the fbdev core to invoke the
> I/O-memory helpers by default. This default makes it impossible to
> remove the I/O-memory helpers on systems that don't need them. Setting
> the pointers explicitly will allow for the removal of the default. If
> a callback in fb_ops is unset, the operation will then be unsupported.
>
> Initializing struct fb_ops via helpers macros will also allow for a
> fine-grained setup, depending on Kconfig options. For example, it
> will be possible to leave out file I/O if FB_DEVICE has not been
> set.
>
> This patchset contains the majority of fbdev driver work. The updated
> drivers now initialize fb_ops with __FB_DEFAULT_IOMEM_OPS_RDWR,
> __FB_DEFAULT_IOMEM_OPS_DRAW and/or __FB_DEFAULT_IOMEM_OPS_MMAP if
> possible. Some drivers now use FB_DEFAULT_IOMEM_OPS, which sets all
> fields correctly. In Kconfig, each driver selects FB_IOMEM_FOPS to
> get the helpers for I/O memory. Drivers that use _RDWR, _DRAW and
> _MMAP unconditionally select FB_IOMEM_HELPERS, which selects the
> correct modules automatically.
>

I looked to all the driver changes as well and couldn't spot any issues.
For all the driver patches:

Acked-by: Javier Martinez Canillas <javierm@redhat.com>


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

