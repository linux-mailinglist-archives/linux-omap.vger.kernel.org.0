Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895123C23DC
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jul 2021 14:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbhGINCl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Jul 2021 09:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbhGINCl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 9 Jul 2021 09:02:41 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D500BC0613DD
        for <linux-omap@vger.kernel.org>; Fri,  9 Jul 2021 05:59:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id n14so23080860lfu.8
        for <linux-omap@vger.kernel.org>; Fri, 09 Jul 2021 05:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SWmHBZLdC5NZNQ2ScKEe+hKqBEvH9WBA7y1IwIcat+U=;
        b=SHs4ajRZPu2SAknqb5pOh0a0zu4Lp06WJUSpv7ADlKwmF7m/CptwMMYT9xq04oL566
         VoGvhT0fw2oLBzGQwRAnhOsze61h0MZAvfFecMaLVnksj1+a5P3v6S6lvvONxb+H5GoP
         265yXNX+KL+xDk9KuFZM7WRBZq6OZ2bnt2pvyhuMrmXFa0LRB3yImNeRw7rSFCfCNZA7
         ydtOjPBLyYR5Lcvxuu1gzQZ3OTC2PygNq7uQC8cmVZdB1KmBMe4icTZDVddn3fBOZw8k
         O16hf501P1n34XxWHvXp+BpjLsCd+A7IWDdYE5WFjXKpwpk4jlNPO6AuzbDymCnqWF3k
         U6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SWmHBZLdC5NZNQ2ScKEe+hKqBEvH9WBA7y1IwIcat+U=;
        b=HVtcXhEZQrZ39Yl01DkGZIhnS6fs2FL/rihc8w/ZPJuPDk+G33DCJJoTTzxQUsWhnN
         62CgpEMYtVwt+Via0fcm/9+BfKj6fZFQ2Ad9qdXuR+cEBSa9apY9hoGgbIeDORHKY5+Q
         L8DiOCqFTFnKIm3arSEz2ymgdddmjjPEr7g+ddUzYnnGt2quY5VirRA8CeAv4wKJSzA6
         GJkUsTBC7ogHSCtMbLEpDik7iuAi/7uWuJyujmxGvfUPurJLGC7s5OKyUa7+q0HvrdVm
         Oa0qBh+iwKogAixi17NTXB2mUs5yOAd9Ua5Jr6ODs2PeFqYKiOQQ9LYSfc+2drpAFLm2
         nv9w==
X-Gm-Message-State: AOAM533nv9eBKwOfe38B/gWUFw9H62ljzOUWWuKR1l3b5rKa6D3UmsUj
        fFHCKp93j441EAgQ1DM3lA4=
X-Google-Smtp-Source: ABdhPJxgALEChnkxIOwqkPMPhicimI9FDt604TMi871X8mCspd86mTWsO5netvQY66sQRvBUiNMgMA==
X-Received: by 2002:a05:6512:1327:: with SMTP id x39mr29651277lfu.37.1625835595239;
        Fri, 09 Jul 2021 05:59:55 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id a26sm463370lfr.58.2021.07.09.05.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 05:59:54 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and
 OMAP4 support
To:     Mark Brown <broonie@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
 <20210707173245.GK4394@sirena.org.uk>
 <b800e9ff-c8dc-ca09-8b2d-a750f05edb12@gmail.com>
 <YOftKVAsRaxtEY8n@atomide.com> <20210709124004.GB4112@sirena.org.uk>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <50098bbb-089c-298c-1370-07179103706b@gmail.com>
Date:   Fri, 9 Jul 2021 15:59:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709124004.GB4112@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 09/07/2021 15:40, Mark Brown wrote:
> On Fri, Jul 09, 2021 at 09:31:05AM +0300, Tony Lindgren wrote:
> 
>>> The ASoC patches are not affected by this, it is just that we need to
>>> block SIDLE mode in a different way than how I did it in the last patch.
> 
>>> I'll take a look on how to implement the needed quirk for the McASP
>>> module, then I can send the dts+ti-sysc patch to linux-omap.
> 
>> OK sounds good to me.
> 
> So should I queue the ASoC patches and then let the DT patches go via
> Tony's tree?

Yes, please. I don't know when I will have time to revisit the DT part.

-- 
Péter
