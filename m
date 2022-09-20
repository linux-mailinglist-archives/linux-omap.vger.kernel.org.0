Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3775BE08D
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 10:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbiITIoS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 04:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbiITInK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 04:43:10 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 876121144
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 01:43:04 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id t14so3053623wrx.8
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 01:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ZAvpaKWIaaoimaKjPK1x7A0zdLqSXC/UFwK6dwBQMK0=;
        b=qil5CI8ZgMDde9d0fVqQ92tNYoZQiq+YviE4kATTTjVYdv8DqBP2SvToJtP7HZE/Qc
         OPrDZ5/pWh32nXeuqOsdjgJ2PLwsw1e+iplSh8UaM9q5HBvT1CUr/YJAlhsWN66oUhY9
         h86IidvkuYCrEh5cuBkHR4ZlR1m9dvlfaXC8GI5HcuLKle3H6ZPhFH1hsSPzAxOUCNNx
         3FmDm/7U99X/inrEvKrDoafjOF74OBmn87Un2CgzFluBkN/40DB02xf86h/AzujdEJK0
         tPd9WQ+nkznN1ZPUdNxaHmce778/tXvWuQWpfV46wb7jaik6PScs/Yd1HVsPxTswXGb1
         NoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZAvpaKWIaaoimaKjPK1x7A0zdLqSXC/UFwK6dwBQMK0=;
        b=qk4YoRiOzGgFBbwEAjoRh86cpt+vpv0F0cGP3dMx9bLvwiHsIHLpD5M/A9DBubfYP2
         /SRwF6R/fRysofZ54Zu7wkLDDr6hs9a5EThEUHL12k6R2Vqxu1qyKCpUveH4hI9uKkLW
         0q4dZ1WHeHOxA9yMpq8WIMTHpSkqmHGACn9C5c+Hs/mHiOj6VJEnzcO2BZFSRQgYNuVi
         bOg8k4PjLsph4AZN2s7uzjsR3gm+6+eLtnCI5ZcLAvLRl7Equ3nXNbA2yampe2ET6AWO
         o1Go8k8ZAkQKS8guqzIgnr+J/JT1kBnKgl57S6G4i/MVAk1VRsZoBUBnpINaC/6UNEYE
         nzNg==
X-Gm-Message-State: ACrzQf0ZfmPkPKIsaOZq/2efOV/5yhd49JyxmMMaR0AxnBVa7Z8HyRiF
        Zyrq8CwYxEQAfQ1E0/1/Z1+2ZNgbH3wYFA==
X-Google-Smtp-Source: AMsMyM5JOaLA06azudJailoqlVmLEIyphiCdHLd/EoI6PHfi903eB0VsEQnVUqyZ7z6/SIdBPkOi8A==
X-Received: by 2002:a5d:4d0a:0:b0:228:d9c0:5abe with SMTP id z10-20020a5d4d0a000000b00228d9c05abemr13721513wrt.693.1663663382969;
        Tue, 20 Sep 2022 01:43:02 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id q9-20020adff509000000b0022aeba020casm930504wro.83.2022.09.20.01.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:43:02 -0700 (PDT)
Message-ID: <53810023-206a-c5c5-e88c-d56dc9ce00e1@linaro.org>
Date:   Tue, 20 Sep 2022 10:43:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/9] clocksource/drivers/timer-ti-dm: Drop unused
 functions
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Nishanth Menon <nm@ti.com>, Suman Anna <s-anna@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220815131250.34603-1-tony@atomide.com>
 <20220815131250.34603-2-tony@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220815131250.34603-2-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 15/08/2022 15:12, Tony Lindgren wrote:
> We still have some unused functions left, let's drop them.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Hi Tony,

applied, thanks

nice cleanup!

   -- D.

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
