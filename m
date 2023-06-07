Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F82B7259D9
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 11:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236500AbjFGJOm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 05:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239911AbjFGJOU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 05:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864B51BFB
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 02:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686129141;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=B3BIYD3PXMtQvTPGQV01/1k0Hmx/7PJYivm+5X8kP8U=;
        b=O+IETPrpEKa5dZUBQt2NtWpk9csmzf3XlIbfvYXhRQyGDov4ThNqiSRuLbAQFf0DO92KaE
        Wvmnuxky8x4QhIc1CqB9mYrxaRADznaMPy/OMvpyhO6GTGyxl4waEC6HpZILJfIGVzs0z2
        DJKr+KE6MwDS9vbpvjJ3or6EsnSdvPw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-clViu8UtMRie3KD9UuCUtA-1; Wed, 07 Jun 2023 05:12:20 -0400
X-MC-Unique: clViu8UtMRie3KD9UuCUtA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30e4943ca7fso1216163f8f.3
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 02:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686129139; x=1688721139;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3BIYD3PXMtQvTPGQV01/1k0Hmx/7PJYivm+5X8kP8U=;
        b=JzeFhYIMDO/RWJHhIepwtiioBHgaEow9Gjt9gerlfppOfNYvYZ2dUdWPtSbOkAqcmM
         AHod+4TdV9RGXUWbS21ARvCDV9VfGHO8yo4C9YC3ExM/RYibTWZJZMbaJapjS8xC1cv8
         Mck5ZydKVywqil1dFiZJZC66aIfClS/DZzojY/OsInLctQvCTJlm9K3moCa5K9T+9puL
         ZbikF2vUAeNy8nFNkdLV2N+WYYkjsuUQFp6973Xk7doCiEJzvgoqQ7WWujpFfzb2sDMU
         7xgpdTYI3jzwhVn0dsvRHyUAnAuu27lvGR3Y8IQmrwxyMiAlZjrQ3mhbVUuYzKOn9ASt
         D6qg==
X-Gm-Message-State: AC+VfDz+DF7KxIWOXt3P6I52ARIp5FrXuKkZzwipTOO9xxmeCEkqB2oK
        rYDLk+MlUKVnQ6fmkXWya5IdVimyeaNvJKPLrufya1akZoIZeiDlOxoa9ezA0msuvVyspJo9Xfo
        vvPxXwg846GyvV308m411Ug==
X-Received: by 2002:a5d:55c6:0:b0:30e:38d3:cc4f with SMTP id i6-20020a5d55c6000000b0030e38d3cc4fmr3742546wrw.36.1686129139399;
        Wed, 07 Jun 2023 02:12:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wzUZfsA9VSizf9bxaqukgTVAwDp5W+57tfKmlffItPyQVvcHhSQ5E8wYACr5/gCv7xQF2rA==
X-Received: by 2002:a5d:55c6:0:b0:30e:38d3:cc4f with SMTP id i6-20020a5d55c6000000b0030e38d3cc4fmr3742525wrw.36.1686129139085;
        Wed, 07 Jun 2023 02:12:19 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003f60101074dsm1447712wmc.33.2023.06.07.02.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:12:18 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 21/30] fbdev/sm501fb: Output message with fb_err()
In-Reply-To: <20230605144812.15241-22-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-22-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 11:12:18 +0200
Message-ID: <87o7lreivh.fsf@minerva.mail-host-address-is-not-set>
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

> Fix case were dev_err() is being called with struct fb_info.dev.
> Use fb_err() instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

