Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61144493669
	for <lists+linux-omap@lfdr.de>; Wed, 19 Jan 2022 09:36:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345438AbiASIgF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Jan 2022 03:36:05 -0500
Received: from m12-11.163.com ([220.181.12.11]:19044 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343962AbiASIf5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Jan 2022 03:35:57 -0500
X-Greylist: delayed 914 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Jan 2022 03:35:56 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Message-ID:Date:MIME-Version:From:Subject; bh=O0PTM
        6yNmHHx88b8fnQze07UFxYqiDlITLrv05Ku0Ck=; b=M0wXUnnDjl4O/mzyiojg/
        +Ck0iENFY75WMiXjbCKRVD5gzScim4iJkoqOkorEAiU0Dw/w2C5bGPvvCgs4feSA
        tMqMfL3LpD+3Xrmgx97CQ8visqCH/1zpPsC27r+tqH75IcE3UYUc/j+/TeBTHl6a
        t1LUvj+/8lAyhM6WeJywkQ=
Received: from [192.168.3.109] (unknown [218.201.129.19])
        by smtp7 (Coremail) with SMTP id C8CowAA3TkrFyedhxZ1iAg--.40740S2;
        Wed, 19 Jan 2022 16:20:21 +0800 (CST)
Message-ID: <63abe475-710f-9ff5-ef20-c78b2a3d5e5c@163.com>
Date:   Wed, 19 Jan 2022 16:20:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To:     linux-omap@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>
From:   qianfan <qianfanguijin@163.com>
Subject: OMAP GPIO ready too later
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowAA3TkrFyedhxZ1iAg--.40740S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxeT5DUUUU
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXQWN7VWBmyZlbQAAsZ
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi everyone:

On my board there has a gpio watchdong connected on am3358. And I found 
that the omap gpio device ready too later so it takes about 5 seconds 
when the gpio-wdt is ready.

I had tested on some version of linux, check when the OMAP GPIO is 
ready. Next is the log:

v4.19 [    0.195191] OMAP GPIO hardware version 0.1

v5.4  [    1.168868] OMAP GPIO hardware version 0.1

v5.9  [    4.598052] OMAP GPIO hardware version 0.1

v5.15 [    1.253851] OMAP GPIO hardware version 0.1

I can't find which commit slowdown omap gpio driver. could you please 
give me some advice?

Thanks

