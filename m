Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3CC67255F7
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 09:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237815AbjFGHjb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 03:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238513AbjFGHjB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 03:39:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38212738
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 00:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686123401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VCpM3n9uxiNBqWYphesbEdJfBdCBdNVjlNpr9KooViE=;
        b=IXtZa3k9G+j2InWFcIipN6/AtSQoZyrLaSy9r0BLgAmFyrJ+HDripo8AV/zugNQ0+zoyGm
        fgRT3oWOrLtNrt1rqHwbxn6TH1O9/8gm9zJC2sMiFCE25OM0Z6VX2zi+6iCbd69PBQpxzB
        ctOc10/YsT5b72Gqbbq+SPsulkWtINc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-cy1KzpkONN2uXLiiKSXguQ-1; Wed, 07 Jun 2023 03:36:40 -0400
X-MC-Unique: cy1KzpkONN2uXLiiKSXguQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f7eb414fcbso6566035e9.2
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 00:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123399; x=1688715399;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCpM3n9uxiNBqWYphesbEdJfBdCBdNVjlNpr9KooViE=;
        b=FoNY0dpJectxSfR89l/MSIRoJNZGS0q8JrnihUTpa6VxGee9eCxaTxHn/T4KGzLQLC
         xsn/zKsGhWz3IrzUJ8wOLWXSCpeuZI+hFeW7MjqJcITPJeyeb5f9Sas2mK9G4q2BerDe
         Hiejylu86+LJem4ig4+zKffS//QgEvLsHYyEuwIudy6ZzwFHv0Cp/FJ36gqSeixEukXw
         Xw8ozp1+1O4LMQ+m1G5bj7Ry6yo4WDyxLv6mMJZpq0ncHiIbSmCvLoF5GkDiajgWrFG8
         d8WWK6g9NUIaIxTb8CjkOlJ4ujzhJ81mtys1/fU46bz1kGa+yzh41ZW3cv9iqytF6UyV
         5UBQ==
X-Gm-Message-State: AC+VfDxV4Wl5vHtlrhjnZo7YczkqOU1EBKJxwlk3OBl/RsDBtBuB/SJ6
        +JmA2dFy8//LaCG8LE8cGfJ1fPSWWkxgtdrHTuu6ZnA6QwYpBILal4l0mQehKtX9fJRJuLpBWbH
        Db1UsFBP7TUUgZguCkaD9Bg==
X-Received: by 2002:adf:fc48:0:b0:30a:f0fd:dca4 with SMTP id e8-20020adffc48000000b0030af0fddca4mr3438815wrs.3.1686123399229;
        Wed, 07 Jun 2023 00:36:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4QHTJetA/ydYNcZpnkz18WI9SIVhHJpnswtj0+WuXSdy2RjUolx7XRR0vsMR7cmSEWXP1qKQ==
X-Received: by 2002:adf:fc48:0:b0:30a:f0fd:dca4 with SMTP id e8-20020adffc48000000b0030af0fddca4mr3438803wrs.3.1686123398984;
        Wed, 07 Jun 2023 00:36:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t7-20020a1c7707000000b003f6cf9afc25sm1125337wmi.40.2023.06.07.00.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:36:38 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 04/30] fbdev/atyfb: Reorder backlight and framebuffer
 init/cleanup
In-Reply-To: <20230605144812.15241-5-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-5-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 09:36:37 +0200
Message-ID: <873533hgfu.fsf@minerva.mail-host-address-is-not-set>
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

