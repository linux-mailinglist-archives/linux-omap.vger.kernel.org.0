Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC0217259B0
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 11:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239826AbjFGJLj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 05:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239860AbjFGJLN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 05:11:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A411FFF
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 02:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686128965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=G+PL21gB/daxR4zsJJ2MptIbuOMEv26lDV4Pg4ezd44=;
        b=arIXfBEYN6IM8CQbHpUfWR8D6iaDFiQbOWVyTTSvfj8nnZOr7p2sIRIYIH4Jy8Ufwyokgu
        /g2v84TNtexuhPSIDFT7mXHg16BNzNE/vRZUNtx+5tYcspqA9jk+mloVnj3Nc2We9deP81
        2j+vPm5/natzbSqgMPcKR/OpzUbnPNk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-0RTyoWF7NF-vdKCtIVr8ew-1; Wed, 07 Jun 2023 05:09:24 -0400
X-MC-Unique: 0RTyoWF7NF-vdKCtIVr8ew-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f5fa06debcso43316175e9.0
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 02:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128963; x=1688720963;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+PL21gB/daxR4zsJJ2MptIbuOMEv26lDV4Pg4ezd44=;
        b=GFjpm8f8+Sr3Z/7AoJRFWH4ekg6f+yK7czI34NVgIAkqaBb6AgTuT37SaHbMpyY04r
         B2gFf5MqrMGwUDqZEG7k6Q5O8O0K7u6b1EICjGFuHkJ4YG3TNEIMO8wgdxbrpQg+siPU
         JVc3xZt3qZCE7Of5IghAsb8tJqx0kOzf97ZIWLG9J4sXMMObyRkTBS8/hvs+I3CHa9Ab
         f7wUD6rbBS2IZyQV1iD2ElQxnXZeaE6kIeBvfVPEYo9A7Sd/2m3OsW6acwaggc5DkUPO
         0IWilAplfrjS14ppvoQNbL9+97IX6wdJzchVbo18u6ryPZ+Z7WkZ2ubBvo75/MPIZ/l0
         kV8w==
X-Gm-Message-State: AC+VfDzeIm43H+C0c2dAx6XljQ1V++yUPnGDgTF0qn1aMKPV0PFeIAVa
        ahZBjK8pWehE7Um9EisKJ7GqfjsGWjDlb0EZMJCIWH9P5whYSKWMv0kH3IUFCYaQI2OVaN9/n3M
        dH32jqg8my8VrUxuLpHPXow==
X-Received: by 2002:a05:600c:b45:b0:3f4:d18f:b2fb with SMTP id k5-20020a05600c0b4500b003f4d18fb2fbmr4423506wmr.8.1686128962968;
        Wed, 07 Jun 2023 02:09:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7KIDwr6/boDKEelyImr80QUEOg3IdkbWZ6AUo87k2W9nGNMdMne7IQ3JZzUQzQ4CBO1bqmKA==
X-Received: by 2002:a05:600c:b45:b0:3f4:d18f:b2fb with SMTP id k5-20020a05600c0b4500b003f4d18fb2fbmr4423483wmr.8.1686128962700;
        Wed, 07 Jun 2023 02:09:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k26-20020a7bc41a000000b003f60e143d38sm1426996wmi.11.2023.06.07.02.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:09:22 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 16/30] fbdev/pxa168fb: Do not assign to struct fb_info.dev
In-Reply-To: <20230605144812.15241-17-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-17-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 11:09:21 +0200
Message-ID: <873533fxku.fsf@minerva.mail-host-address-is-not-set>
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

> Do not assign the hardware device to struct fb_info.dev. The
> field references the fbdev software device, which is unrelated.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

