Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1916672594B
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 11:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238701AbjFGJDj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 05:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239516AbjFGJDM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 05:03:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0F01FFA
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686128451;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rVTR4IxyLBLXJW/X4J1N4pKhPGAjKCq/t5JfKIVV29U=;
        b=IDJpD5gQeZiVhhfAYknJ+UrCFMA9z/Bm07Oy9OEyKLXQc77SaCVrm/yxVW6idrlHgIjn3C
        PgoUXFAxHm2UVNhSMLAol/62sf2PMzTIKXE0Nysq5CzKgtq3o6l3l3jkvh+f8u59XzrI30
        9mjLBHpmpOpeLx7S8Jr6KkHrOUBN+IM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-_C-x0GTwM8G3Gtkiteq58A-1; Wed, 07 Jun 2023 05:00:49 -0400
X-MC-Unique: _C-x0GTwM8G3Gtkiteq58A-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f60911a417so35423085e9.2
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 02:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128448; x=1688720448;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVTR4IxyLBLXJW/X4J1N4pKhPGAjKCq/t5JfKIVV29U=;
        b=KCnuul0xct5vyVL9Ou5iEkm/XtsQLqSbn7x5KiaGsd4JLQ1uWZJu2uAdMWAV69E8af
         vk/QI55ELuvMLXY6YbvO+65WFQnHGKFLydJu5JmXpupTYtRej0MNXzS6khPyrcax7MCY
         4tvetbUA7+dcnvSlocGjARV58jbaa6e21MM0yZAe4Iv9yQ2okZGeL7CXnzjh5yAV2JSb
         EolWMpA7B2uSdr3WJm/kspm4nCUkcLOLrhA8wBU75qFjLCVm8r7/Y+8x8MYLrTiCGYSJ
         xvVq4PmX80fkf37H9+/zdgKeKIcyueqR4ScHQfdqtKfYvFSlIUF9ALnGC7Bu95MAgj0e
         78Eg==
X-Gm-Message-State: AC+VfDwWOhFuPOvq/H+ykIZzuDA/K+Vtx38Ho9X/HFN/KzENFrVnWdOb
        gmA2F6asX0P1fnrrZYSmG4J2PxKQdJjxKJ0TW3jHpz9mOTnQxd0d4wkXZIUsrkrP6P0iCbiOSuI
        LEXBn1AzWuM3wYZMHbfKAjQ==
X-Received: by 2002:a05:600c:202:b0:3f7:3575:9e28 with SMTP id 2-20020a05600c020200b003f735759e28mr4341992wmi.41.1686128448791;
        Wed, 07 Jun 2023 02:00:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6DpfZRaNzsiu/uAACD5Q0ndg8v93wxyuv2x48c658BhjUxR/uhCQIbScZ6GMWBCIsDezZdiQ==
X-Received: by 2002:a05:600c:202:b0:3f7:3575:9e28 with SMTP id 2-20020a05600c020200b003f735759e28mr4341976wmi.41.1686128448503;
        Wed, 07 Jun 2023 02:00:48 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c294200b003f7ba52eeccsm1449794wmd.7.2023.06.07.02.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:00:48 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 12/30] fbdev/mb862xxfb: Output messages with fb_dbg()
 and fb_err()
In-Reply-To: <20230605144812.15241-13-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-13-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 11:00:47 +0200
Message-ID: <87fs73fxz4.fsf@minerva.mail-host-address-is-not-set>
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

> Fix cases were output helpers are called with struct fb_info.dev.
> Use fb_dbg() and fb_err() instead. Prepares fbdev for making struct
> fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

