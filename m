Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA7927259C3
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 11:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239398AbjFGJMf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 05:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239449AbjFGJMI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 05:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E27D4173B
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686129027;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EIz8b97+2mar2ffqQ22U9WQizWobZ+ziDNV+MHu5qjc=;
        b=JY+mwF/pf9OnprNtZLhk/UnUqGl6KHprB0Nx5I4sEopGBFyaXz5wxoZL3uCL6WWTFKKiQZ
        vUn2hEg01hgtLBifOfdkZ/ckRrxv7H6sb6hPIbeF3EDZWfyUg7gWW8L+dg9ddgCRsJVMW4
        LrHf1IQ1niWZlRvzTfjP/BicdzGTVMI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-VCjNQc-KNOufxfoueMwnWA-1; Wed, 07 Jun 2023 05:10:25 -0400
X-MC-Unique: VCjNQc-KNOufxfoueMwnWA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f7aad897a5so55128105e9.3
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 02:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686129025; x=1688721025;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIz8b97+2mar2ffqQ22U9WQizWobZ+ziDNV+MHu5qjc=;
        b=gYx4+Wa8KiIAhUtVULqBEUm4rgvK1lQSQidP7jQepTjJ7IvZkjBlDUNaUvaniVb4CC
         AtdAJB6pHKqXYu62quznoKx0VOAUx78O6fMyFZ5itIhcGQWDBzMMqarihGqyFHWWNYvS
         S3Jgd5HuHDP/USobgEhXGejLB6tKdR1VFwxORePaJFx8l3SYMziFUjmvsb/TEJ7eYBZ+
         gXXSMJBeCxHRaDGJOp38wHn/gbfQf+YRHeJg2TlVysWIaGrsd7DUhZCw8v15DV13L38M
         hnS5MbfQ250r6T5zDNI3TOlLUstQnpf0YulGiE3aEWfn3/urN59D5832mj00OruUHN6Y
         wl0A==
X-Gm-Message-State: AC+VfDyoXaplJyMjRkPX/wDA6S4Bzjt3nxC6x/TfYhhZWz6vm/1Ag4b7
        m7VF7nIy/45x2RMAcYn0U3YrUcu+GDxeVpdlbMsdeJHtlqW/r0w5Z4mvhgHgFIe+/RLA88eqt2Z
        uATQ0QH+lZC+uUKRcvefJUg==
X-Received: by 2002:a05:600c:a395:b0:3f7:3401:17ac with SMTP id hn21-20020a05600ca39500b003f7340117acmr4587427wmb.5.1686129024878;
        Wed, 07 Jun 2023 02:10:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ePD432YmabNuUR+sxJiR/Lq4y75rOFMJQocJYAFtsL3UId8CM+YY12IKNvHU0PgR+SDGlYA==
X-Received: by 2002:a05:600c:a395:b0:3f7:3401:17ac with SMTP id hn21-20020a05600ca39500b003f7340117acmr4587416wmb.5.1686129024708;
        Wed, 07 Jun 2023 02:10:24 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f10-20020a7bc8ca000000b003f7f249e7dfsm983105wml.4.2023.06.07.02.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:10:24 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 18/30] fbdev/radeonfb: Use hardware device as backlight
 parent
In-Reply-To: <20230605144812.15241-19-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-19-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 11:10:23 +0200
Message-ID: <87wn0feiyo.fsf@minerva.mail-host-address-is-not-set>
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

> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

