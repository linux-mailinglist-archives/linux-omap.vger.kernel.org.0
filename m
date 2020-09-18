Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7362700E0
	for <lists+linux-omap@lfdr.de>; Fri, 18 Sep 2020 17:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgIRPZH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Sep 2020 11:25:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40318 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIRPZH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Sep 2020 11:25:07 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IFP4hB024869;
        Fri, 18 Sep 2020 10:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600442704;
        bh=Ri8n0vQ0JS3Rglyk98eSUKquY7zrHEoKeNa5GObXALA=;
        h=To:CC:From:Subject:Date;
        b=KUXR+LfsfhFKYEmIN71ooDwv93u5JJ6OhIdVfd5Lt7bwrnHF7NOugMretUQrIiNkN
         jRyBCMvkkYQ45/y3TphUk4tz6XPT4cHDBF6iyspQT3HP4r0RFyh3bzKs3svhqjufIp
         EosYY8SxCVp1oyvG8isqFqJ1aHzlQcZ7AjDlpOFs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IFP49N033455;
        Fri, 18 Sep 2020 10:25:04 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 10:25:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 10:25:03 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IFP2mx118678;
        Fri, 18 Sep 2020 10:25:03 -0500
To:     Linux-OMAP <linux-omap@vger.kernel.org>
CC:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Slow booting on x15
Message-ID: <ea02f57e-871d-cd16-4418-c1da4bbc4696@ti.com>
Date:   Fri, 18 Sep 2020 18:25:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Has anyone noticed that booting would have slowed down in 5.8 and in 5.9-rcs? I'm booting x15 with
my custom config builder, which uses omap2plus_defconfig as a base. I see:

v5.7
[    0.597765] cpuidle: using governor menu
[    0.793198] No ATAGs?

[    9.654611] Run /sbin/init as init process

5.8
[    0.616660] cpuidle: using governor menu
[    4.439856] No ATAGs?

[   15.484710] Run /sbin/init as init process

v5.9-rc5
[    0.706165] cpuidle: using governor menu
[    6.761812] No ATAGs?

[   19.522536] Run /sbin/init as init process


So v5.7 boots quickly, and init starts around 9.6 secs. 5.8 is much slower, and 5.9-rc5 even slower.

My config builder enables all kinds of debug options, so possibly it could be just more debug
features or such having been implemented, or enabled in omap2plus_defconfig...

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
