Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BEA2DE172
	for <lists+linux-omap@lfdr.de>; Fri, 18 Dec 2020 11:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgLRKqZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Dec 2020 05:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgLRKqY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Dec 2020 05:46:24 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7DAC061282
        for <linux-omap@vger.kernel.org>; Fri, 18 Dec 2020 02:45:44 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id i9so1638420wrc.4
        for <linux-omap@vger.kernel.org>; Fri, 18 Dec 2020 02:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=58X31zZpONeEKwQdcdX8fGmd9oTd9u4c+E9558qGKSU=;
        b=JlW8X6b2tP9pUaPsTXXX5hdRh+Qn4YzkBdbOVjAsGpiQsBThpDT0M6ux6qPrdVA/Ad
         /J8fcH+6jYPPuiEXgUCBR+fQHRgkFopX5abwCdFaq9TqcZEZPwTMVzT4Oun5c6AnqqeI
         GeC1Oj92H9Ae6GHgNGxuf6xgTytKZsaOGwha0fbAVOk/ZGgC6Nn/NOsuG+r8b4yX1voX
         pwprJ8pXqDxRDtQTgpo8aFIUCHTI06J6OhLyuTmTlmEQzISfHjauvvaP+a0zJoREX5jm
         ium7SY7q+qMONEkuvC881zsg6MjDU99qD464siHR2Y3sIcBmZf1wfYtqcxIXliD8gVmR
         MZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=58X31zZpONeEKwQdcdX8fGmd9oTd9u4c+E9558qGKSU=;
        b=mUp7npHuWgIkcBt9ZaYrssPmYsvO4HX7EpUQlI8NU9f/gB6sx9oS7nm5MdqZeFYvtw
         l3IZeW9BJPSCU8zMjoVz9yKqsC/QEWzc/55rAi6f6uMBvkvlPJ2MVhbtq0yxxHr49UMM
         CHyf9uCMTxXBJ6oo4PpDWw6ucrY8bhuvyBeQuBdQ7kRWgBDTei/Z9wdNszo6umeqJpoZ
         tXiIiL7Y8Tx7so3Ujtc9R3KDa55coJBOiukthxmYgbLLOk2bCNV2iFDOz+QDD3lydXxh
         e6vOxf8nI/TSN2d4Iufg4REDN26odBZo//Rq/xDcAjriPERVLb5Nze8D2qcAdE0uuyqT
         hL8w==
X-Gm-Message-State: AOAM531xkdZOCxSy+heVhYVlKzjd93LITmKwS1Mn2sxJeomtpBr8n7KU
        CwbNGsAYlJBnuDIZ+k/d3bRY5c6UnyQrow==
X-Google-Smtp-Source: ABdhPJw3rMz0JuHJtNI5TvKJwMhRsZYFrmay2JwIOybU3txdcxLex/rnUmjfipG0+04WxeZ0WnDGDw==
X-Received: by 2002:adf:a319:: with SMTP id c25mr3778258wrb.262.1608288342621;
        Fri, 18 Dec 2020 02:45:42 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:9551:6b47:8c25:8c7f? ([2a01:e34:ed2f:f020:9551:6b47:8c25:8c7f])
        by smtp.googlemail.com with ESMTPSA id h16sm12882095wrq.29.2020.12.18.02.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Dec 2020 02:45:41 -0800 (PST)
Subject: Re: [PATCH v2 3/3] thermal/core: Remove ms based delay fields
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "rui.zhang@intel.com" <rui.zhang@intel.com>
Cc:     "amitk@kernel.org" <amitk@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        "open list:ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER" 
        <platform-driver-x86@vger.kernel.org>,
        "open list:TI BANDGAP AND THERMAL DRIVER" 
        <linux-omap@vger.kernel.org>
References: <20201216220337.839878-1-daniel.lezcano@linaro.org>
 <20201216220337.839878-3-daniel.lezcano@linaro.org>
 <PR3PR10MB414206497B833D717BC627A280C30@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <0f9ef932-b49c-9a1f-71a8-1c9dbf5de520@linaro.org>
Date:   Fri, 18 Dec 2020 11:45:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <PR3PR10MB414206497B833D717BC627A280C30@PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 18/12/2020 11:16, Adam Thomson wrote:
> On 16 December 2020 22:04, Daniel Lezcano wrote:
> 
>> The code does no longer use the ms unit based fields to set the
>> delays as they are replaced by the jiffies.
>>
>> Remove them and replace their user to use the jiffies version instead.
>>
>> Cc: Thara Gopinath <thara.gopinath@linaro.org>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> 
> For DA9062: Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

Thanks !


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
