Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD492E9EC5
	for <lists+linux-omap@lfdr.de>; Mon,  4 Jan 2021 21:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728056AbhADUVh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Jan 2021 15:21:37 -0500
Received: from vern.gendns.com ([98.142.107.122]:50040 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727783AbhADUVh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 4 Jan 2021 15:21:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=bJlwvAcTP6n9JlqTMododdUIqadilk9NCyhFDpB28QM=; b=oejsnWkewMFuL0K3OfU/1ZVdud
        lHDUUVgj8utlNwF/oaBQQ28cGZGupfAkluRFJd71E2ux0p081glR2WFV3O2JM9Tvo1so8ZdS8CyiD
        fcKkn75N3GUW08mEzKm/dpbf/pvNuVGcuImrHc4qfrw2kV33ofJznQPFHnTifVfbgd97485j1FFka
        0xh0ed5I+cw0SZAh1BcPnxPs+/jn62KwkNAtdkilq10Q1MQqpMyaFibef0cTjB0ehy3JuH1/gbqVT
        RD61ieBYnKDv7BsdLYDEGVWh9Yen4dlh6wfwGUjHTteM7Tz9sSkacC73gv4gtWEg4QbGxRCauHUkY
        7EYJLm0A==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:53450 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1kwVxT-0008EX-4A; Mon, 04 Jan 2021 14:56:03 -0500
From:   David Lechner <david@lechnology.com>
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: Add PRU consumer bindings
To:     robh@kernel.org
Cc:     bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        grzegorz.jaszczyk@linaro.org, lee.jones@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mathieu.poirier@linaro.org, ohad@wizery.com, praneeth@ti.com,
        rogerq@ti.com, s-anna@ti.com, ssantosh@kernel.org
References: <CAL_Jsq+W8GuqKdqSxt7bKcfpK3Wg35V9R-3+UzNi_+3uRqA=AQ@mail.gmail.com>
Message-ID: <4fd5d68a-830a-83df-fc7a-1070e2619a86@lechnology.com>
Date:   Mon, 4 Jan 2021 13:56:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+W8GuqKdqSxt7bKcfpK3Wg35V9R-3+UzNi_+3uRqA=AQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Also, I think you can get rid of 'ti,pruss-gp-mux-sel'. Can't it just
> be an arg cell in 'ti,prus' entries?
> 
> Rob

+1 for using cells instead of a separate property.

FYI, we will have a similar issue with the PRUSSEVTSEL signal for the
interrupt controller on the AM18XX. I am still of the opinion (described
in more detail at [1]) that using a cell for this makes for both better
device tree bindings and easier driver implementation. So I am interested
to see what the resolution is here.

[1]: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20190708035243.12170-5-s-anna@ti.com/
