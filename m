Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F021DE784
	for <lists+linux-omap@lfdr.de>; Fri, 22 May 2020 15:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgEVNBe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 22 May 2020 09:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729046AbgEVNBa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 22 May 2020 09:01:30 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA536C05BD43
        for <linux-omap@vger.kernel.org>; Fri, 22 May 2020 06:01:29 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k13so10121151wrx.3
        for <linux-omap@vger.kernel.org>; Fri, 22 May 2020 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9X+6V5jDmeXTe6rS8P4JClAQNJrn6NvnpP1JB3UFEbw=;
        b=YWkUKysrh6+PMjjUTe5ooMNLZS4Sp7v0UQTdOOQNicRmgEf860gCAhKd4iWSHOF72e
         jm3ChkOUgSK4DLya4RvXq8yUfIpCze+gLJDZFCO4LZ3UF/6GkygmGMt2PA714u9D6mxZ
         rWMr4jB3CzL7zvC1iQ67OD0PiS4Qu7V+BO2Suu5KcIIwI72DwK5uQcICLhezjVyMk5Vn
         sIZQAuSUVqZwsHPeppZrpH7ECdE5lXD/W9xgY1CaKVzQYHaQwovjjZBDCk8UtXE0kNyo
         6bgxeerdor9S2W1uLBNNwIUeZ3h5a3GyNaxo0wFD7IkwRsetuaB/AmgtPSqlAIsttUIn
         1xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9X+6V5jDmeXTe6rS8P4JClAQNJrn6NvnpP1JB3UFEbw=;
        b=Zd91DnXWEo1JiI3O41lpo5T2NgqUv/UPTjtyDJ0fiBcnxWylTT/3dxCdE1GmII0xul
         usoGYW4jEO8+YO0y9pRXlOasoKLKsr504cYYM52SH+CTf7wAg24GqQDMcmVZGxcLaULG
         wPZNqoX9hviKbjCn/mMr1bIrPzt+2tahXvqdU7eB2XonZdagi8bcRD4OXl+7UGthPRYC
         h/eFUzY5fCvGwFlvOyC1IcUtSj5tO4dkIC5Ti5gBQp39mWD/OAueMH4awpPXlGSQfeGs
         iAv4G0602hpSLkuYDJpqkWGL7jd5koG0HewOqomqxxKLdkjpjbmr4kF3roKz94BlmG3n
         zVGg==
X-Gm-Message-State: AOAM531d6/grqTHiS9L8dMFlej3URrfKaDbtyXyUL9eizkMzajTnx176
        Ln5z+oX8aRRxX9W9qFotuwMuzA==
X-Google-Smtp-Source: ABdhPJxJ8KBrYk08oALRCUqYyvoY0fMNZPijmmysUh2NVhGB194Z3PpAkmAZwdK1JrZCQ2rLDVlmOQ==
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr3605467wrv.166.1590152488310;
        Fri, 22 May 2020 06:01:28 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a? ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
        by smtp.googlemail.com with ESMTPSA id 62sm8518652wrm.1.2020.05.22.06.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 06:01:27 -0700 (PDT)
Subject: Re: [PATCH v7 00/15] Add support for devices in the Energy Model
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
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <abff69b6-b033-18e2-f380-ceccb42c6b01@linaro.org>
 <3f6652a5-ad9b-15cb-08a8-160becd3f912@arm.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ef4b039d-b445-6ef1-8f62-00dab112e37b@linaro.org>
Date:   Fri, 22 May 2020 15:01:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3f6652a5-ad9b-15cb-08a8-160becd3f912@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 22/05/2020 14:58, Lukasz Luba wrote:

[ ... ]

>>>
>>> The patch set is based on linux-next tag next-20200508.
>>
>> Do you think it is possible to respin against linux-pm next ?
> 
> Yes, I will do it and send the v8.
> 
>>
>> I wanted to try the series but I'm getting non trivial conflicts with
>> the devfreq_cooling changes
>>
>>
> 
> Let me take care of this.

Thanks Lukasz !
-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
