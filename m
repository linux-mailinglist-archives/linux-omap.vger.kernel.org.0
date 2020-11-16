Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A302B5091
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 20:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbgKPTMR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 14:12:17 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60018 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbgKPTMQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Nov 2020 14:12:16 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AGJBwli076471;
        Mon, 16 Nov 2020 13:11:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605553918;
        bh=t60DnI5YCD6HaN90PufRT/hJS+sgAJ7rmVoY+7yi4ik=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=IkHkTwZHnAEhiHTzJNP+6Iq3yjOylGIzszMX18faLh8Yp3QtSeunICM3USXHEQ1Dv
         7sh3sxSNQ9tD8OOpMnCbF4rGvGcGp2Yzas8l5mkSkAfqKIn23HUh/sV2pgyymwZkZ/
         W8dgIhAWIqdrnQqUdnu4CdAAo9Q+D6vhYVknuhdQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AGJBwSQ018067
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Nov 2020 13:11:58 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 16
 Nov 2020 13:11:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 16 Nov 2020 13:11:57 -0600
Received: from [10.250.38.244] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AGJBv70045665;
        Mon, 16 Nov 2020 13:11:57 -0600
Subject: Re: [PATCH v2] soc: ti: pruss: Fix wrong check against
 *get_match_data return value
To:     <santosh.shilimkar@oracle.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <ssantosh@kernel.org>
CC:     <lee.jones@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <tony@atomide.com>, Wei Yongjun <weiyongjun1@huawei.com>
References: <20201116172233.18459-1-grzegorz.jaszczyk@linaro.org>
 <7a18452c-8c9c-df7d-b175-529ab690623f@ti.com>
 <528e56d5-23d5-9f83-1bf4-a7f786593eae@oracle.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <af1ecbaf-52e5-5e8b-2b0c-ee8cfe5cb0f0@ti.com>
Date:   Mon, 16 Nov 2020 13:11:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <528e56d5-23d5-9f83-1bf4-a7f786593eae@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/16/20 1:06 PM, santosh.shilimkar@oracle.com wrote:
> On 11/16/20 9:31 AM, Suman Anna wrote:
>> Hi Santosh,
>>
>> On 11/16/20 11:22 AM, Grzegorz Jaszczyk wrote:
>>> Since the of_device_get_match_data() doesn't return error code, remove
>>> wrong IS_ERR test. Proper check against NULL pointer is already done
>>> later before usage: if (data && data->...).
>>>
>>> Additionally, proceeding with empty device data is valid (e.g. in case
>>> of "ti,am3356-pruss").
>>>
>>> Fixes: ba59c9b43c86 ("soc: ti: pruss: support CORECLK_MUX and IEPCLK_MUX")
>>> Reported-by: Wei Yongjun <weiyongjun1@huawei.com>
>>> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>>> Acked-by: Suman Anna <s-anna@ti.com>
>>
>> Can you please pick this up for 5.10-rc's?
>>
> Nothing is broken so I will just add these for next merge window.

Yeah, that is fine as well. Thanks Santosh.

regards
Suman
