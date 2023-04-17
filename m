Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 228146E4115
	for <lists+linux-omap@lfdr.de>; Mon, 17 Apr 2023 09:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbjDQHdF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Apr 2023 03:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjDQHcg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Apr 2023 03:32:36 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429CD44B3
        for <linux-omap@vger.kernel.org>; Mon, 17 Apr 2023 00:31:46 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id vc20so6666161ejc.10
        for <linux-omap@vger.kernel.org>; Mon, 17 Apr 2023 00:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681716704; x=1684308704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=12OUf6kLU6TNVZfMTHeDlcExQnBKxAwKBVZHkBwyBFQ=;
        b=XkRXvybLRILOCl9UjWWwC416VlmQ1cloVDtRdRMCaW6fCchS93jRl3ZZB3S/OKfOO1
         flVGv4nRiyhoaIQr6bpWJZ6ehBq3GdRdrJiCn2BuampIZGrn/5Qsdo0gNntwamuAIo8M
         fBHFGeQQzwulRe8nrxJNZgxjjrHwyzDM/UDsEo9PVk7I1D/3mRWMbX4gxiH6Aq7xxAu7
         yhXcnGxiO21/Xz+1lHaeT0W+DohMLnQol/iua8Pp2i3jF4NvsYd9+1CPznsGj2hWo8tK
         rfrOqxnBATcw68tJryEcohh/q30nypfck0kw97kuYdvDdMpcgC2RucFbp0zOvCCxQWMI
         517Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681716704; x=1684308704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12OUf6kLU6TNVZfMTHeDlcExQnBKxAwKBVZHkBwyBFQ=;
        b=Rfp4DUh9AjavYib59DyEafLVOLAnT8y8p3LewzIfGqjeUw81BmT1D8w4lDJ7V3FV1Y
         5bVGzDxrxpT0mRYfj/hkIvhXN0WcoCJvqokuvnedR/l+80tJ3k4MOTc8t+mzzEqYUEoN
         CUKX4rygKulmLMmA1145Drs/pw0Om5YlvsbusEu4IvMmSW3JwcbGuj2NSJ1NFLpkd7Z5
         c8izg5i/uTFaepRE0sc9cmt3+cMlKMaX8Y6S9uYs4U/evx5R0hZZmlFIbHh5bcqOH3gk
         n56iuTSZeE28EgCotD7WmvKFVlhKihipPHc7cSr3T64cbvRzTRdJJUJXwRJMS7ZaGo5P
         J4/A==
X-Gm-Message-State: AAQBX9exhI5vJ41n0sawNFdAAYE11tEVoqFdxp2NiYNVsaw3zmtNHuEt
        mRzJNLucKYpUcfDWdjqfXI9RnQ==
X-Google-Smtp-Source: AKy350Zun1iojsgu+Iufa0ecefqx6Gc/dz4MSNM63NxqwR0162CzaBXUQuv9HyZjSJm3stl/4Kc0QA==
X-Received: by 2002:a17:906:5151:b0:932:40f4:5c44 with SMTP id jr17-20020a170906515100b0093240f45c44mr5346557ejc.36.1681716704483;
        Mon, 17 Apr 2023 00:31:44 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ld4-20020a1709079c0400b0094eaa31aa63sm6004648ejc.77.2023.04.17.00.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:31:44 -0700 (PDT)
Message-ID: <09ff37fa-9f53-a53e-ab43-1da2576aa908@linaro.org>
Date:   Mon, 17 Apr 2023 09:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix finding alwon timer
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh@kernel.org>
Cc:     Georgi Vlaev <g-vlaev@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Nishanth Menon <nm@ti.com>, Suman Anna <s-anna@ti.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230412064142.12726-1-tony@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230412064142.12726-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/04/2023 08:41, Tony Lindgren wrote:
> Clean-up commit b6999fa1c847 ("clocksource/drivers/timer-ti-dm: Use
> of_address_to_resource()") caused a regression where pa is never set
> making all related SoCs fail to boot. Let's fix this by setting pa
> if found.
> 
> Fixes: b6999fa1c847 ("clocksource/drivers/timer-ti-dm: Use of_address_to_resource()")
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

