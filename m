Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC6486623C3
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jan 2023 12:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236848AbjAILEt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Jan 2023 06:04:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237075AbjAILEr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Jan 2023 06:04:47 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFF1178A7
        for <linux-omap@vger.kernel.org>; Mon,  9 Jan 2023 03:04:38 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id h16so7732186wrz.12
        for <linux-omap@vger.kernel.org>; Mon, 09 Jan 2023 03:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F1o1h0/8Z9CTd9JzV9HYcBGjMEGQHN88SqgrqMI3CKE=;
        b=JfOf7Ybc+GU1nn8y1UcCvxhLZxdJnTmM6yTssoaGD6iHkSp9kw+vB/gkiSd9BYh1Ev
         0QFxzWP/4tG540eJGRXWjtCmZaqkjyjagRDq8bBhASM3grdf91bjsYv4KgV91OB6++4s
         YsO8YvQsF+0XVZ29S/f//4CfrmOe9Sy50FKX3juIAKrtyF082yVw33n51qKs/qdi7yYI
         5jeqjXKki1UkPiZnTc5D0T6QLRHn9xrUgbQ09ydGm4qnjFUmkdixeoByKFU5eYtKy7FR
         6A31HILTPPT2+/z7YlxLdMYcewFPN71b3Dgv09t0GfYu7LRrYZNWfX48SDylX3W4GzdP
         ASMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1o1h0/8Z9CTd9JzV9HYcBGjMEGQHN88SqgrqMI3CKE=;
        b=qXwQZH9J3c5Ud/sBMXvz1OVH8nOAF2fqBLXff3Pf9SwLf2CfqGnkA2lK5NwxQu0sj4
         NaDeiFXphs0+F2aSgpyrFkcWzu/UNuiGruDBtHaLXFR3QCyB2wdxyRuvMrG+uJ6NwE0k
         L8gdkacGzTxoLOyym4jVIXJmr0WtnlFJf8KX9NJrxZY8q4T4ymqHUc6mKRwaaFAE+1rK
         a2kMyToPqJdVkwNGUbBv5t05KhsgfV2tdvrbetdw2W1vg0fc2a1QOWDMftWhcXl73udU
         0yAXx9lenxLYX34PDI9H+YgPZf/EIERHt1T9uRD3kjSq5iLlHkrcx1QleEamqOz2KvrI
         VzYw==
X-Gm-Message-State: AFqh2krT/dmSmI0QED+fTltytqmPJIjVValtULdhu+OuHCnSHAttuRT3
        C1+fgm38kPtRxIB7aJOJb3Mzeg==
X-Google-Smtp-Source: AMrXdXt0sWws9FC7FmSd3zSlUGnJeOxvVL6lisTvf8bQ3vSNu8uoGcg+vPo7j6+ZFs9pmgtUvQuw9w==
X-Received: by 2002:adf:d846:0:b0:29f:4e42:33c5 with SMTP id k6-20020adfd846000000b0029f4e4233c5mr14183491wrl.55.1673262277116;
        Mon, 09 Jan 2023 03:04:37 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id z6-20020a5d6546000000b002bc371a08adsm2060413wrv.101.2023.01.09.03.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:04:36 -0800 (PST)
Date:   Mon, 9 Jan 2023 11:04:34 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     sam@ravnborg.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Helge Deller <deller@gmx.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Antonino Daplas <adaplas@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>, Lee Jones <lee@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 14/15] backlight: tosa: Use backlight helper
Message-ID: <Y7v0wiBHXy7lH6tz@aspen.lan>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-14-1bd9bafb351f@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-14-1bd9bafb351f@ravnborg.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Jan 07, 2023 at 07:26:28PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Stephen Kitt <steve@sk2.org>
>
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
>
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Just for completeness...
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
