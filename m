Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5728DCEC5F
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 21:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbfJGTAa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 15:00:30 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34852 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbfJGTAa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 15:00:30 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97J0K4N123042;
        Mon, 7 Oct 2019 14:00:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570474820;
        bh=0vcs8rJ4wLMMAot/YqVdXrTFHozVQXOKjEGPQggiNtA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=x6uUPj56N0zvOFeyYbLxOa+VcLOYM7KLO1Ih8m9afOoWDqwMxacQLCzQ+8Ru1Iv2g
         5k/iGHUUHlFQnNLC0NBnDu/41EISo6wU72Ws/yvwmT7J20f3t3j4btKIWfS8rsxNZz
         5vWWm+8h4pq6J2q4y3t6jB1mF3s9O48ZSoZeCIRw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97J0Kw6063227
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 14:00:20 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 14:00:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 14:00:18 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97J0HRM099832;
        Mon, 7 Oct 2019 14:00:17 -0500
Subject: Re: [PATCH 0/3] bus: ti-sysc: fix reset sequencing
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20191007122931.18668-1-t-kristo@ti.com>
 <20191007163807.GU5610@atomide.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <32031606-23da-2e0b-6d75-7225a082eb6b@ti.com>
Date:   Mon, 7 Oct 2019 22:00:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007163807.GU5610@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 07/10/2019 19:38, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [191007 12:30]:
>> Hi,
>>
>> These three patches make sure that IOMMU/remoteprocs work across
>> all devices with the latest OMAP PRM series for reset support [1].
>> The last dangling issues were caused by the removal of the hardlink
>> between the reset + clock drivers.
> 
> OK. I presume these are safe to wait for v5.5 since we don't
> have the rstctrl driver yet?

Yeah, they are safe to wait.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
