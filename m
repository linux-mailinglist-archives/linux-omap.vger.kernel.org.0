Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7424F435
	for <lists+linux-omap@lfdr.de>; Sat, 22 Jun 2019 09:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfFVHow (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 22 Jun 2019 03:44:52 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33862 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfFVHow (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 22 Jun 2019 03:44:52 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5M7ioUC102053;
        Sat, 22 Jun 2019 02:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561189490;
        bh=qQtXR14x4+gV1DNHGvOFHxW3UZSeZjxVv+1CVz6yETA=;
        h=To:From:Subject:Date;
        b=zFjnEzzLwkbXvnf3neinbJ/5K6rz2S1sSrK4sGRGsH6Z9bkRnQPaFwSWnNL03wLz9
         aqjVjxUJUh5G/nN9Gu0MjTG0cD6C+u4ng+f4l03vbWzTyUOUeaVYOJJW3tFyGwHkqv
         LPDh8Og96dWD4LV1HfflUmiFeoNbct9y20saUmqM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5M7ioQg117008
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 22 Jun 2019 02:44:50 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sat, 22
 Jun 2019 02:44:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sat, 22 Jun 2019 02:44:50 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5M7imcI106156;
        Sat, 22 Jun 2019 02:44:49 -0500
To:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
From:   Keerthy <j-keerthy@ti.com>
Subject: DS0 broken on Linux-next-20190621
Message-ID: <12e578d2-1b54-67aa-a81e-5ce5a956fcd3@ti.com>
Date:   Sat, 22 Jun 2019 13:15:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

Seems like suspend fails on am437x-gp-evm on the latest next branch.

commit e2d28c40292bdc35553d599e5bbbeaefbab49416 (HEAD -> local_next)
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Fri Jun 21 20:58:07 2019 +1000

Basic suspend is broken i believe.

commit 9e0babf2c06c73cda2c0cd37a1653d823adb40ec
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jun 16 08:49:45 2019 -1000

     Linux 5.2-rc5

Is fine.

I have not done a bisect yet. I will see if that gets better in the next 
couple of days else will need to debug.

- Keerthy

