Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838D8449AF6
	for <lists+linux-omap@lfdr.de>; Mon,  8 Nov 2021 18:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236568AbhKHRqK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Nov 2021 12:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbhKHRqJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Nov 2021 12:46:09 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08015C061570
        for <linux-omap@vger.kernel.org>; Mon,  8 Nov 2021 09:43:25 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id f4so65446163edx.12
        for <linux-omap@vger.kernel.org>; Mon, 08 Nov 2021 09:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V9DcSgqCjKR/wGotEn+yw7r67/AYLDgR/ccibCOh6/I=;
        b=VQmGrzfDEYLvIn49piE4JEtXWKKz/4s0zcyTvhcuGMiPtiD7xZLg/D3aHwBMUsv9+n
         xb44J5cbT51uCceoQ2Ewejx6xOcM4DjExfvrESA9ZYOzURtGhLxZupFKcL//K8QXIjHP
         sdWSEAvAYRIBUwB1Q1n9rrN+ohhGihskcrbwYW6nnCkIdeLvlaxwJXOdjnEhCoToUzV/
         jX6cYLG4YH3vPMiYUwW/3gXSI9teXFDBfuuxYiX032Op2FV8EjarHZ6cozW9a9MfQT4r
         yB5CMhpFMbXpQ24wWGcozq98Ffbs66gUXULk0cppg342xejbiOmCwMGbYKA85xTl50oF
         Nd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V9DcSgqCjKR/wGotEn+yw7r67/AYLDgR/ccibCOh6/I=;
        b=a3XM7M2KpQkZNfG7hGk9lnJqE9TSMS4piJijZzLE2qo68Y1Zh9mqFa99p6bO/og/cn
         aeXrsZlvYfn/cp8Y2fHG7WX4zT+onTtfgw1BWj6A2Dt1F+uyJWRybq8qcZES+KJzhqdb
         /+ITIRs6nL+ZAdjVI8DvMKLL8PKeeiCnYDti8aIRGELAAObpQHVNOK9s8Nuy2H5qzYdu
         hlaFydTUZ1/3yT7fep6G6QL/7hWxKhKrzelVRemcJlodadRRBCcODtUlhsFSBQLig92M
         lgZx0I4+r36r06FqXbRUwnNgFkH1Mbnd4beaOgSLaxOSI+cxBRR0U/TO/EV+GxGCkiOf
         pGyw==
X-Gm-Message-State: AOAM531JjXK9DNBM+b+Aiddl0pb978Vbw2/WXsocqMM2ZkW6t4c0Y8Eh
        NDzcV70g/G8X1bhkNCE/nS0bKGWIrY8=
X-Google-Smtp-Source: ABdhPJxN5CovFOJtg0VPJ+IAO3WAyY99DzOazmJiIzh1sieLst1d7BfSE8eJe0AD86O1pF+gcHWQSA==
X-Received: by 2002:a17:907:6287:: with SMTP id nd7mr1237563ejc.152.1636393403634;
        Mon, 08 Nov 2021 09:43:23 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id eg33sm9613029edb.77.2021.11.08.09.43.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 09:43:23 -0800 (PST)
Subject: Re: omapdrm VRFB rotation
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To:     tomi.valkeinen@ideasonboard.com
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <92fd80eb-6591-fb45-8885-309c79c2d4c0@gmail.com>
Message-ID: <689ba705-c7fc-428c-3288-0c4adb3cc63f@gmail.com>
Date:   Mon, 8 Nov 2021 19:43:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <92fd80eb-6591-fb45-8885-309c79c2d4c0@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Sorry, mail was sent to the old Tomi's address.

On 8.11.21 г. 19:05 ч., Ivaylo Dimitrov wrote:
> Hi,
> 
> Currently omapdrm supports TILER rotation only, which excludes omap3 and 
> earlier SoCs. I have the hardware (N900/N950), time and will to 
> implement VRFB rotation support in omapdrm driver, however, I'll 
> appreciate some hints. Or, if there is already something ready, please 
> point me to it so I can take it from where it is.
> 
> Besides partially reverting 517a8a9564c0dea98e6d4e2c7f0fe4cbb9b8c9ba and 
> copying VRFB code from omapfb, is there anything else I shall take in 
> consideration? Or, VRFB driver should not be a part of omapdrm, but a 
> standalone one?
> 
> Regards,
> Ivo
