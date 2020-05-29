Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663C81E8573
	for <lists+linux-omap@lfdr.de>; Fri, 29 May 2020 19:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgE2Rnc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 May 2020 13:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728082AbgE2Rnb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 May 2020 13:43:31 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A60F3C08C5C9
        for <linux-omap@vger.kernel.org>; Fri, 29 May 2020 10:43:31 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id n5so4628316wmd.0
        for <linux-omap@vger.kernel.org>; Fri, 29 May 2020 10:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gVHswwd0kSAFGKu/imUZP8zXFuR2uDAO/9AxJgTWj2k=;
        b=vNp+WRPzmVLo1r8+DFAF8gNmZb/28QvNPt/T2VsGiAimd+bWW8HoyDgA44dOUlNzMk
         fY65A1nqYFgcKpVZcbbW6tYLMtlh1ht+H5UUiLrE4WcIm9kEtdVSx+NatHrZ+lmYrhhC
         TEkORAF/qRMaBY4K+bWEZXNc34wV8hrH9Sl3bfCSd73vqQudGr/rBOnFlwIQXYpV3J4O
         YveoFJuluD6cvfUPa7l+Qm9w38CmY64aFpgFFPWvaEWCWqOWPw39DK4zY7+IW5lqL77K
         De+wvJPgksSh0vXciTQWXdpFVX/+YAGuASngCU8rlZeV4qPQ6T0jq8K2Odu8OOwprjGT
         T3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gVHswwd0kSAFGKu/imUZP8zXFuR2uDAO/9AxJgTWj2k=;
        b=UrrQ7XLsbl+NQWQHSNX9LAbzaesqard3/Kq5TnY0VCxBovCeQiQad0GDlue9ZtZ6cm
         lqYL4Ru4KjfI0J1UcFkCerhl8uXFPxi0iYMIzrPoxp2dHqyZ6nqck7jiGjDrwJEMQ4RG
         sN9kSx21U8iCCJDS/fHXm28lNl8z6czluwhwyCg6Q4zORwBdcKmYgcPwi6i0KMMIehl1
         LHLUuO6SeAbsLRgksig0x842oQ/8ZCmOoct/1F4c4ujohAShMLRsKaeY2CQvmItU+CL3
         0Vms88qidYj6bY4X+jA/XrLxevvGTpUzRxkSIcZj/tOYVhyq+3KXw/kPqnCvrSPkg3RN
         pkzw==
X-Gm-Message-State: AOAM5306cl3Z1HaFzq0pNyy2fvljYDHedkVyEGIXKy71hLtZGvw2lIbz
        tYy4YAqjBx0wklUgWmUjJq0TJw==
X-Google-Smtp-Source: ABdhPJw5RPN4E4dGorLBaNA+WhTMk21B9a7oGwIJp3X1RT5IwHv1j8KNJcB+UIWbVhdzlIO7TazAAQ==
X-Received: by 2002:a1c:a403:: with SMTP id n3mr9510567wme.98.1590774210138;
        Fri, 29 May 2020 10:43:30 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5568:5913:8a3a:5e4e? ([2a01:e34:ed2f:f020:5568:5913:8a3a:5e4e])
        by smtp.googlemail.com with ESMTPSA id q13sm10600040wrn.84.2020.05.29.10.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 10:43:29 -0700 (PDT)
Subject: Re: [PATCH v8 3/8] PM / EM: update callback structure and add device
 pointer
To:     Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com
Cc:     Dietmar.Eggemann@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, rostedt@goodmis.org,
        qperret@google.com, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org, mka@chromium.org
References: <20200527095854.21714-1-lukasz.luba@arm.com>
 <20200527095854.21714-4-lukasz.luba@arm.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <666b2f9e-d7ed-6ddb-80aa-e63ab9909ee6@linaro.org>
Date:   Fri, 29 May 2020 19:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527095854.21714-4-lukasz.luba@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/05/2020 11:58, Lukasz Luba wrote:
> The Energy Model framework is going to support devices other that CPUs. In
> order to make this happen change the callback function and add pointer to
> a device as an argument.
> 
> Update the related users to use new function and new callback from the
> Energy Model.
> 
> Acked-by: Quentin Perret <qperret@google.com>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

[ ... ]


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
