Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2C27259D1
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 11:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239881AbjFGJON (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 05:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239899AbjFGJNs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 05:13:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5BD272E
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 02:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686129122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=x1ensWxwtR1H9WH8H1jKCiwbKVNzMfKW0b7Yi6bDGCs=;
        b=Rw3pCjTpt9XnUIyWO17xfgpW+nbLu/9Jc9vjwcKo+hetVemSQO6ga+9bMDuAk8eM9krOcP
        TNhWJVdY07re7tVP3KxRT7SULEng/Ku2wzqlUuci5pQIZtf0bqSWCMI+eIayYThZBSK+Sp
        YYvw/3Jr29Ql24FjwcwYIbWu6y4nPsA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-ow5Kr-eKNpaplOnkKObksA-1; Wed, 07 Jun 2023 05:12:01 -0400
X-MC-Unique: ow5Kr-eKNpaplOnkKObksA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30ae56a42cfso3869556f8f.3
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 02:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686129120; x=1688721120;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1ensWxwtR1H9WH8H1jKCiwbKVNzMfKW0b7Yi6bDGCs=;
        b=U7hpB2t+3cHnxKTRSNyQZ9UI6PigaXIrCet+te2AN69cUxjL+1AvflZ6uXVkhQtbIm
         xnvAWgrEFC2Di+F6BfbuiMpxqJJCf7mnWZOJef720nJO7HehJRVxULDMtuTKLxlJNw/9
         Y4xgQFMF4tmuzKfif/Z+HxWTsNfhExvwU3xdcoln6QLR3fcTr95YcmI8uLnHFPmcXVkt
         IEKv2BTdOJtCYE/2gR1iUv63kuBQwsU+wNNSZmSULgR+F43PlhNW2rD86XIX7uGCfSpT
         PO8PnAR/q0Ne7C1o6FFcHW7haSSvrhzkmMq9slcR+pZv/YinJN2aL0SBSU2Yn+EC94pJ
         D2wA==
X-Gm-Message-State: AC+VfDwGBE57ihn5vatLv61VwSZLJSjsiAERcOnC45DL8+Gc0mwhZ58d
        wU0YqfBD6qGrWu4ZzN/PdNqWQdJj9q51OsKAKjjRyDxlKTeNL83jHImVSzx0RZrm3QOnXe7qkzh
        j7DMrCXkRG5rxnECwj2DAnA==
X-Received: by 2002:adf:efc7:0:b0:30a:eada:8b9b with SMTP id i7-20020adfefc7000000b0030aeada8b9bmr4008353wrp.41.1686129120263;
        Wed, 07 Jun 2023 02:12:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pKDNydRWrc71fW3bUFKqJDv/PfRpGWQYSkEIZ2IoZqLYQ3oH2ibQ9gh3nWmNRpad6J8Zxng==
X-Received: by 2002:adf:efc7:0:b0:30a:eada:8b9b with SMTP id i7-20020adfefc7000000b0030aeada8b9bmr4008341wrp.41.1686129120078;
        Wed, 07 Jun 2023 02:12:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id w3-20020a5d6083000000b0030abe7c36b1sm14722806wrt.93.2023.06.07.02.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:11:59 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Antonino Daplas <adaplas@gmail.com>
Subject: Re: [PATCH 20/30] fbdev/rivafb: Use hardware device as backlight
 parent
In-Reply-To: <20230605144812.15241-21-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-21-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 11:11:59 +0200
Message-ID: <87r0qneiw0.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Antonino Daplas <adaplas@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

