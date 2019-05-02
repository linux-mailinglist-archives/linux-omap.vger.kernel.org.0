Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95EE81135A
	for <lists+linux-omap@lfdr.de>; Thu,  2 May 2019 08:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbfEBG2Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 May 2019 02:28:16 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38620 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfEBG2Q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 May 2019 02:28:16 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x426S9PR088543;
        Thu, 2 May 2019 01:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556778489;
        bh=4W5NF5LPDXhXIgev9Ksl3pErFzytM1EAAoht5kAVYFk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jsHYTre/9ZJSYePtw3BbKHZQJQfuAHLuoF1D7S85oNCIA5WTtkv/FIp5VxmEab+k8
         hg0otHbpVuv3mCAIReqfLL7LseckGf44lmdOMBI6bZ/r+192b2JdLlvooTS2jWclJ1
         yjJPVR+NPh653z+tQ6F1uA2hnZk6uAGvWUF7O8Hg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x426S9xQ081780
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 May 2019 01:28:09 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 2 May
 2019 01:28:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 2 May 2019 01:28:09 -0500
Received: from [172.24.190.215] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x426S6nl116280;
        Thu, 2 May 2019 01:28:07 -0500
Subject: Re: [PATCH] ARM: dts: dra76x: Update MMC2_HS200_MANUAL1 iodelay
 values
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <bcousson@baylibre.com>
References: <20190430060856.18445-1-faiz_abbas@ti.com>
 <20190430155415.GI8007@atomide.com>
From:   Faiz Abbas <faiz_abbas@ti.com>
Message-ID: <9e32440f-cdab-eb79-2abb-9b0596701743@ti.com>
Date:   Thu, 2 May 2019 11:58:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430155415.GI8007@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 30/04/19 9:24 PM, Tony Lindgren wrote:
> Hi,
> 
> * Faiz Abbas <faiz_abbas@ti.com> [190429 23:09]:
>> Update the MMC2_HS200_MANUAL1 iodelay values to match with the latest
>> dra76x data manual[1].
>>
>> Also this particular pinctrl-array is using spaces instead of tabs for
>> spacing between the values and the comments. Fix this as well.
> 
> Is this needed as a fix or can this wait?
> 

This is a fix. The new iodelay values will have better marginality and
should prevent issues in corner cases.

Thanks,
Faiz
