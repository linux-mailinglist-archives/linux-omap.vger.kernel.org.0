Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946FF1709C1
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 21:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbgBZUex (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 15:34:53 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54348 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbgBZUew (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Feb 2020 15:34:52 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QKYoVx054186;
        Wed, 26 Feb 2020 14:34:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582749290;
        bh=hF41gy+lcQTQR7PdtnKUn49x1C/p9dpf1Y9QElKklKc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ER7BoOsoacAyESLgiN8P8l4iSDLa8Gjm+5Oz4QFOWYWcvDIrOHsB9crjQ84eTRz59
         0UaF2VP4ipY65L5JLQHwLBFiF8trI+ocSXnoQmb+kNyyaMjIOgafwDffk4gvX8BqKD
         ee6BDQG0mW1H1mVnwySWVZ2ikpvQOwU0gyqfddrY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01QKYoCm034977
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Feb 2020 14:34:50 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 14:34:50 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 14:34:50 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01QKYojg022322;
        Wed, 26 Feb 2020 14:34:50 -0600
Subject: Re: [PATCH 06/12] ARM: dts: am335x-bone-common: Enable PRU-ICSS
 interconnect node
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200225204649.28220-1-s-anna@ti.com>
 <20200225204649.28220-7-s-anna@ti.com> <20200226182924.GU37466@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <af3965db-54b2-3e4f-414f-d27ca4b5ced1@ti.com>
Date:   Wed, 26 Feb 2020 14:34:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200226182924.GU37466@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/26/20 12:29 PM, Tony Lindgren wrote:
> * Suman Anna <s-anna@ti.com> [200225 20:47]:
>> The PRU-ICSS target module node was left in disabled state in the base
>> am33xx-l4.dtsi file. Enable this node on all the AM335x beaglebone
>> boards as they mostly use a AM3358 or a AM3359 SoC which do contain
>> the PRU-ICSS IP.
> 
> Just get rid of the top level status = "disabled". The default
> is enabled, and the device is there for sure inside the SoC.
> And then there's no need for pointless status = "okay" tinkering
> in the board specific dts files so no need for this patch.

The IP is not available on all SoCs, and there are about 40 different
board files atm across AM33xx and AM437x, and am not sure what SoCs they
are actually using.

regards
Suman
