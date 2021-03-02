Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B8A32B0FD
	for <lists+linux-omap@lfdr.de>; Wed,  3 Mar 2021 04:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbhCCAmh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Mar 2021 19:42:37 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:45419 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382093AbhCBIza (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Mar 2021 03:55:30 -0500
Received: from cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net ([80.193.200.194] helo=[192.168.0.210])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lH0nC-0004i8-Bt; Tue, 02 Mar 2021 08:54:10 +0000
Subject: Re: [PATCH] memory: gpmc: fix out of bounds read and dereference on
 gpmc_cs[]
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210223193821.17232-1-colin.king@canonical.com>
 <20210302084402.4qw7ltj4ivcoxs4t@kozik-lap>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <0dc9ab31-85ce-5e66-f18b-f15436784ae9@canonical.com>
Date:   Tue, 2 Mar 2021 08:54:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302084402.4qw7ltj4ivcoxs4t@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 02/03/2021 08:44, Krzysztof Kozlowski wrote:
> On Tue, Feb 23, 2021 at 07:38:21PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the array gpmc_cs is indexed by cs before it cs is range checked
>> and the pointer read from this out-of-index read is dereferenced. Fix this
>> by performing the range check on cs before the read and the following
>> pointer dereference.
>>
>> Addresses-Coverity: ("Negative array index read")
>> Fixes: 186401937927 ("memory: gpmc: Move omap gpmc code to live under drivers")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/memory/omap-gpmc.c | 7 +++++--
> 
> Thanks, applied with Tony's ack and changed Fixes to 9ed7a776eb50 ("ARM:
> OMAP2+: Fix support for multiple devices on a GPMC chip select"). 


Thanks for correcting the Fixes line

> 
> Best regards,
> Krzysztof
> 

