Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE7B2E2BAD
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2019 10:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732359AbfJXIDa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Oct 2019 04:03:30 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47538 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfJXID3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Oct 2019 04:03:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9O83PU3077238;
        Thu, 24 Oct 2019 03:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571904205;
        bh=ahkheHdvISzf15d7sur9d9o5j3dq5r0rit5YOypGFLM=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=p0L7iw1Bw6qD3C3SCrDeqDlj0vcAuNepJKDAx4pm8pnKCm0KmTzEK0EHucATL5kBY
         xOz2VxtNSBVXdfw+EGNa65E1tb9Pxq+grCe1fizcEbbrV/9uj//Nt3Nu8EwckAI4T8
         WzXoL1JqJty5Z0PIwoNmqj8dWq3YEG3tWN3sfNYs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9O83PhG052261;
        Thu, 24 Oct 2019 03:03:25 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 24
 Oct 2019 03:03:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 24 Oct 2019 03:03:13 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9O83KFs058138;
        Thu, 24 Oct 2019 03:03:21 -0500
Subject: Re: [PATCH 0/4] clk: ti: re-work divider clock support
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>,
        <aford173@gmail.com>, <tomi.valkeinen@ti.com>
References: <20191002120611.26121-1-t-kristo@ti.com>
Message-ID: <1115e221-1523-1a60-02a3-1f1939170e64@ti.com>
Date:   Thu, 24 Oct 2019 11:03:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002120611.26121-1-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 02/10/2019 15:06, Tero Kristo wrote:
> Hi,
> 
> The existing divider clock support appears to have an inherent bug
> because of the bit field width implementation and limitation of divider
> values based on this. The limitation by bit field only is not enough,
> as we can have divider settings which accept only certain range of
> dividers within the full range of the bit-field.
> 
> Because of this, the divider clock is re-implemented to use min,max,mask
> values instead of just the bit-field.

Queued this up for 5.4 fixes, thanks.

Tony, do you have anything against the DT patch going in with the rest 
of this or should it be dropped?

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
