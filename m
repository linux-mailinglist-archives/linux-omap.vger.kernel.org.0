Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3D0725635
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 09:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235497AbjFGHp6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 03:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239432AbjFGHpH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 03:45:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF8F1BFF
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 00:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686123709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zrMzVIVwuoeUQwH5hpliW2Jq51XgxuMBmmo9TGjEBeo=;
        b=DcMtqFOks/T2jqDkgzKDsboQ0sNeHns63qbfmZyRKBR0G9U60VnMEjc8KEIt5ngQxcJuBD
        rUIHrzHhoxT7IXS29iLgdlBCDpkuza/C4tsARYxiNKkGL/B1UtNESxVoZZ40lm0PSEKSyH
        tBBMNEB+1ophg/tNIJqZHZaNIn5GXsk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-XzRbYbKLMUmBogNfx9hanw-1; Wed, 07 Jun 2023 03:41:48 -0400
X-MC-Unique: XzRbYbKLMUmBogNfx9hanw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30e4d11a413so145774f8f.1
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 00:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123707; x=1688715707;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrMzVIVwuoeUQwH5hpliW2Jq51XgxuMBmmo9TGjEBeo=;
        b=gQ9Qrf+d2+HvSPnAZW4c36UOSRNF5uRtPtXUSIwP+x0vzpQihE32MbzACt5henSNBR
         GFSu3JlcQNf+CcBrL4VjhFi+ceh8oVMPryP37dsjMjoITsUPzUbvd0x7kdbdhUO2i6kE
         uE8xf+Be/iYpoYVcJp0fz+SF6GCkiWXivrsF2184QCSPXgfQJXapFwZN5YVDxfXJVQ+g
         yZV6sflaW0l7avPifeH7AqQsUb2NN1AGa0+o8/w+Xwz3j/1Yr6VLTs/0c4zYpJ2yHxhh
         X9F6rVcSCk/pIXTZWCaUW0E5kW9Yw48kN8Jt8fvuezPzaAPhzgtD3k/A/bs4xQNQrVgO
         fv7w==
X-Gm-Message-State: AC+VfDxZrcURtvT1PHqR6+Wo+vS62j1zR3mP/cIa5hmr72lMBNXurTcg
        paYa9RCC5jUOSLhrhL5cCpnSDLo0oquXePlsSnDwduUXtEPtw73xYrlekCuzwH+Jp1N+2+0njAw
        J35wTvX+1nUe655Fi7PEFXQ==
X-Received: by 2002:a5d:4ece:0:b0:306:2713:f7f with SMTP id s14-20020a5d4ece000000b0030627130f7fmr10418235wrv.11.1686123706977;
        Wed, 07 Jun 2023 00:41:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Zd2a468z/A2yXcthK/MVOYuYJ+/wr3Irr4l7Jvn6olRO9xiMCz+lyONSCQCChNdNZRPbF/A==
X-Received: by 2002:a5d:4ece:0:b0:306:2713:f7f with SMTP id s14-20020a5d4ece000000b0030627130f7fmr10418221wrv.11.1686123706744;
        Wed, 07 Jun 2023 00:41:46 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f17-20020a7bc8d1000000b003f7e6d7f71esm1156174wml.36.2023.06.07.00.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:41:46 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 05/30] fbdev/atyfb: Use hardware device as backlight parent
In-Reply-To: <20230605144812.15241-6-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-6-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 09:41:45 +0200
Message-ID: <87zg5bg1mu.fsf@minerva.mail-host-address-is-not-set>
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

