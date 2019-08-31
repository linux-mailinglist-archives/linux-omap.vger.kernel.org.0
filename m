Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57675A4192
	for <lists+linux-omap@lfdr.de>; Sat, 31 Aug 2019 03:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbfHaBvN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 21:51:13 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51898 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfHaBvN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Aug 2019 21:51:13 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7V1pAB6040153;
        Fri, 30 Aug 2019 20:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567216270;
        bh=18doHv+HrMMX7dKerU+IoPUPYiG7SRItZxnqCf8VQiQ=;
        h=To:CC:From:Subject:Date;
        b=h0ov6tdngoYDadlQu0671f7BKpeLm4ZvAXK+mTNzyLjLQEQ0sImXkdD29aF3TcwZ1
         z8AyShXb2DYzoNR1tZA8nHGyRTJUUwCS7UkEMyQFcYV+fFy3IyRmJaMCjobOy0VvCc
         AJYaibd4031SzdCp4Xbl4kYBpMYAgEfM9d7MKQMQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7V1pAJA045693
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Aug 2019 20:51:10 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 20:51:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 20:51:10 -0500
Received: from [10.250.132.132] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7V1p8EX006446;
        Fri, 30 Aug 2019 20:51:09 -0500
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>
From:   keerthy <j-keerthy@ti.com>
Subject: Linux-next: File system over NFS broken on DRA7/AM5 platforms
Message-ID: <b5f54d5f-4790-7be1-cb65-847a98d2e8dd@ti.com>
Date:   Sat, 31 Aug 2019 07:21:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

https://pastebin.ubuntu.com/p/pt7b3JPgRn/

NFS boot seems to be broken. Works well with 5.3-rc6.

I couldn't do the bisect yet.

- Keerthy

