Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3280AD82F
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 13:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732522AbfIILq4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 07:46:56 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49912 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732500AbfIILq4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 07:46:56 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89BkgW1100884;
        Mon, 9 Sep 2019 06:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568029602;
        bh=/jq7cijuT/yDbpHrSFnEokOE16TAsFzPk4/mkz+03ls=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TQVx9b+vbNf7GOrnZJ6mDALVH/JtzscMXZD/nhzHIkt+7C4u/3HvSNAhBxvNjuVqj
         b35zJA++dtztR1odxrms4/wHESHcUNSDB/NO4gsUWIBK8oGiWi9lYttusrmKHCxd5q
         Vie9lZS06lwE6m5DOXNXwJVLTy16oD6++4PItUEY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89Bkghq027347;
        Mon, 9 Sep 2019 06:46:42 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 06:46:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 06:46:42 -0500
Received: from [10.250.98.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89BkeNh062197;
        Mon, 9 Sep 2019 06:46:40 -0500
Subject: Re: Status of led-backlight driver
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>
CC:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <tony@atomide.com>, <sre@kernel.org>,
        <nekit1000@gmail.com>, <mpartap@gmx.net>, <merlijn@wizzup.org>,
        <tomi.valkeinen@ti.com>
References: <20190907100726.GA12763@amd>
 <20190909111410.dwqvg6b4lgxymn2o@holly.lan>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <e40fcd10-85ef-9e04-0960-210736075f1f@ti.com>
Date:   Mon, 9 Sep 2019 13:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909111410.dwqvg6b4lgxymn2o@holly.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Daniel,

On 09/09/2019 13:14, Daniel Thompson wrote:
> On Sat, Sep 07, 2019 at 12:07:27PM +0200, Pavel Machek wrote:
>> Hi!
>>
>> I don't see the LED-backlight driver in -next. Could it be pushed? It
>> is one of last pieces to get working backlight on Motorola Droid 4...
> Sorry, I dropped the ball on this and was therefore rather late
> reviewing this patchset.
>
> Assuming I have read the code correctly I think there are some
> problems with the max_brightness handling in the backlight code.

Can you comment this? I'll be happy to fix the problem.

Reading the v4 again, I noticed that that I still had not removed the 
brightness scaling. Is that the problem ?

JJ

>
> Daniel.
>
>
