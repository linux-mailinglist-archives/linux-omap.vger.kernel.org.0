Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0CAE725960
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 11:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbjFGJFQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 05:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239322AbjFGJEW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 05:04:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDABA1BC2
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686128530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mH0V+GQH9u3hTOintFl8kIUIu94Srk8ZL012Xjzg5pc=;
        b=iKuQH0GxWKxPxLT/YxKA14uhApMeDKzJIE9ei2uyunvBG8imqFlt9EJbxC+3eH9R9puzf9
        vPza+nZfGqvppbIy0d/sAWLFkO97cJOT0hewS3nBEAKzhDw2Us1Up1Lpqd8gWpG572csOp
        8DOVeLvrFaODbYCRuRjmDKIQVBXVJ4Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-hLhxjitdNj-APl-teHovBQ-1; Wed, 07 Jun 2023 05:02:08 -0400
X-MC-Unique: hLhxjitdNj-APl-teHovBQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30af3835de5so3041453f8f.0
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 02:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128528; x=1688720528;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mH0V+GQH9u3hTOintFl8kIUIu94Srk8ZL012Xjzg5pc=;
        b=hwee/ts5TMMGSLYHKCGKGcL6cl60IgCOWSB/EwioFGjgT4ZHi92Wc+UaNSq5JbJRX8
         ewWQk9kVQl7A/NlsbDvGUzgYYHmhu4Ru7Fk2AzuuzTo0LI/H3t0hvCvg1YymruTwplny
         UbCqBHl676VU62prn9k4lLSdJd28GHEmZ7t+0YTvLvL9LlOVtBC0NoBzQwoQEXL7WlD2
         4EbymTDAdWhNI3QjKRB6aaDYfJedWSIYAODs8kkwKKuPsD/wyKmxzHLaKDvpNUWKVLJB
         WxlU1u/cp4duSRQJ8ENs7OsOX4mrE6FZSviKg83Rcen5HyH2p0vGurl3y7aFq+ekqi91
         M4Vg==
X-Gm-Message-State: AC+VfDwKUFkSnKl2o0yeRgXXMcAdFIU/u9QeZgFU7BN9L24IpTsO7gCu
        XhjhqTTiyvdfnBIklllzAosi0bJjs1WqVd3pIaw0byhtGmJcAdGEksMh9lOijO0IVGZcr6qdVj1
        YCdvzrwAbB5gjFcESmZ46bg==
X-Received: by 2002:a5d:5642:0:b0:307:bd64:f5a4 with SMTP id j2-20020a5d5642000000b00307bd64f5a4mr4077053wrw.52.1686128527752;
        Wed, 07 Jun 2023 02:02:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+RtLt6z9BsPsahZF3tzNThAhq9O2T1soohVRASzXnOQHusHmP/yNJTyZBUwoEWLT/tzAX+w==
X-Received: by 2002:a5d:5642:0:b0:307:bd64:f5a4 with SMTP id j2-20020a5d5642000000b00307bd64f5a4mr4077038wrw.52.1686128527482;
        Wed, 07 Jun 2023 02:02:07 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d4b0a000000b0030789698eebsm14921477wrq.89.2023.06.07.02.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:02:07 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Antonino Daplas <adaplas@gmail.com>
Subject: Re: [PATCH 14/30] fbdev/nvidiafb: Reorder backlight and framebuffer
 init/cleanup
In-Reply-To: <20230605144812.15241-15-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-15-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 11:02:06 +0200
Message-ID: <87a5xbfxwx.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Antonino Daplas <adaplas@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

