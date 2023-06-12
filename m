Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C1572C0E0
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jun 2023 12:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236286AbjFLKzR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Jun 2023 06:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236866AbjFLKzG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Jun 2023 06:55:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC60811D97
        for <linux-omap@vger.kernel.org>; Mon, 12 Jun 2023 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686566423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=75rPdiK8vy0+hfZPm4hKQMMWAw1iiTrCWzbw47oqQ3o=;
        b=N4ulxi9/BO+begjO7UICVMYSVm8uBiFTz+CX0ycR67bA8hX49k1pxNije58maEhkxPYHs6
        vQwk0L+ElXnHFK16MSgOpa3YY+i0yR29gQYI1Si1hp7J9twotGajOR6oZHxURHi2dAigTD
        r/KUiPD6jPasSSmeRz1qQG+DDwkLytQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-X_CwSboDOsWV-eO05Um5Cg-1; Mon, 12 Jun 2023 06:40:23 -0400
X-MC-Unique: X_CwSboDOsWV-eO05Um5Cg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f7f4a7b289so80950875e9.2
        for <linux-omap@vger.kernel.org>; Mon, 12 Jun 2023 03:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686566421; x=1689158421;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75rPdiK8vy0+hfZPm4hKQMMWAw1iiTrCWzbw47oqQ3o=;
        b=Bu4wNGPje/79hW2kqMvmRvzZsuDlB9SU4nX0+f2tYp0glvhc3fmMw86sEkPtCYfHRb
         sSNk6FVwuYYqSUEatsxRUYqOIQzXOjn2txhRwI6y7AXMu2odAoxb7EqXigUnWbIKVZnL
         jn+n3TvgG/r73nJkk+ztFVlqONgjHKuNCbgJkkKd9qU0MPcEQjQGnOMIhO9PpneEdORB
         lkqZ1SAFMZrhNEocM64o06+fe9L/+j4sm1HmqBr0uMvF95aVdyAJt0sXCoSo7BoyCbBJ
         ZjRLhJvo3ETNfjz8tBGbu/EMMPuT959FvWCHyQjmZr3PNzFSYqWKlDT9+D3V8szROo/a
         /+GA==
X-Gm-Message-State: AC+VfDzq3UgC5nrKf0fXJqCYi6DVNnFWWlwVZ78jqQrhWqv//9aK2vAE
        i1xw4uaU8j9gx6omb1VjLl5aQOZ/hVEAyHw6YWOIJeXS3NaZxIB9sQPt8Du/cq7Bh28oQ42zdXU
        rGvP7QigXdDUc6OrgaqQJBoFSBjFXAQ==
X-Received: by 2002:a7b:ca51:0:b0:3f8:1e00:5a62 with SMTP id m17-20020a7bca51000000b003f81e005a62mr1113955wml.38.1686566421735;
        Mon, 12 Jun 2023 03:40:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7MsqRGgveHsuNkfrpDC1Y5y2oZ/Wv2tvp//EQrR0fI03+Glf+TK6KJrHQIoCgU/ovDWpctCw==
X-Received: by 2002:a7b:ca51:0:b0:3f8:1e00:5a62 with SMTP id m17-20020a7bca51000000b003f81e005a62mr1113932wml.38.1686566421434;
        Mon, 12 Jun 2023 03:40:21 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o7-20020adfeac7000000b002fed865c55esm12153178wrn.56.2023.06.12.03.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 03:40:21 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     Steve Glendinning <steve.glendinning@shawell.net>,
        linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 22/30] fbdev/smscufx: Detect registered fb_info from
 refcount
In-Reply-To: <7f62aa10-bc6f-96e2-d2cc-d42f0fad9e32@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-23-tzimmermann@suse.de>
 <87edmmewuk.fsf@minerva.mail-host-address-is-not-set>
 <7f62aa10-bc6f-96e2-d2cc-d42f0fad9e32@suse.de>
Date:   Mon, 12 Jun 2023 12:40:20 +0200
Message-ID: <87mt152cbv.fsf@minerva.mail-host-address-is-not-set>
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

Hello Thomas,

> Hi Javier
>
> Am 08.06.23 um 00:22 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>>> Detect registered instances of fb_info by reading the reference
>>> counter from struct fb_info.read. Avoids looking at the dev field
>>> and prepares fbdev for making struct fb_info.dev optional.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Steve Glendinning <steve.glendinning@shawell.net>
>>> ---
>>>   drivers/video/fbdev/smscufx.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
>>> index 17cec62cc65d..adb2b1fe8383 100644
>>> --- a/drivers/video/fbdev/smscufx.c
>>> +++ b/drivers/video/fbdev/smscufx.c
>>> @@ -1496,7 +1496,7 @@ static int ufx_setup_modes(struct ufx_data *dev, struct fb_info *info,
>>>   	u8 *edid;
>>>   	int i, result = 0, tries = 3;
>>>   
>>> -	if (info->dev) /* only use mutex if info has been registered */
>>> +	if (refcount_read(&info->count)) /* only use mutex if info has been registered */
>> 
>> The struct fb_info .count refcount is protected by the registration_lock
>> mutex in register_framebuffer(). I think this operation isn't thread safe ?
>
> It's an atomic read.
>
> https://elixir.bootlin.com/linux/latest/source/include/linux/refcount.h#L147
>

Yes, is an atomic read but by reading [0] my understanding is that does
not provide memory ordering guarantees. Maybe I misunderstood though...

[0]: https://www.kernel.org/doc/html/latest/core-api/refcount-vs-atomic.html

> And that function is only being called from the USB probe callback 
> before registering the framebuffer. It's not clear to me how the value 
> could be anything but zero. I'd best leave it as is with the ref counter.
>

Yes, I'm OK with that and as mentioned I don't think that's less safe
than the previous info->dev check with regard to race conditions.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

