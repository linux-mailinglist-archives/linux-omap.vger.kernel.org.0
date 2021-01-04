Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678632E9EAB
	for <lists+linux-omap@lfdr.de>; Mon,  4 Jan 2021 21:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbhADUMg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Jan 2021 15:12:36 -0500
Received: from vern.gendns.com ([98.142.107.122]:49348 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728150AbhADUMg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 4 Jan 2021 15:12:36 -0500
X-Greylist: delayed 949 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Jan 2021 15:12:35 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hU6L/HbTEg6Yn+OtW3Z4kUfeWwPdfrHV+fA1tYktCis=; b=iNQQ4x9EnpzV1uNDrzKeWRlKTh
        D0K1GhDBWJ+pLVbDAB3+2XCp3Xfjccq/zX6mxA/3KKt1NXnPXdqfIHCW8oxrF8aHPmcRRk/aNr1Bx
        I6AXZAbWiGeF4JCW5vBjZlz6nXkxLC1Hc3ZBOVbE/6H1kvCkvs4VMawYmK5EqSVtQE1ZdvuEl/QP0
        g2/p7s7zgdPXt/oafBFQTIYHEJc6fr5wKXgj6ZH+Ji5wSHyRFPCcIEmjnfIPPwGt8XOKzY8bN7oDC
        0kUqaFE6Mwgu3zCS3bEvhSEJ9sadiAxLJA0A/C/XpRvQ/hzyibKDlLXFhk0gLybN2ggJ1MmXA/M1a
        GKE0RxJg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:53966 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1kwWCl-0003hF-JR; Mon, 04 Jan 2021 15:11:51 -0500
From:   David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 0/5] Introduce PRU remoteproc consumer API
To:     grzegorz.jaszczyk@linaro.org
Cc:     bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, praneeth@ti.com, robh+dt@kernel.org,
        rogerq@ti.com, s-anna@ti.com, ssantosh@kernel.org, t-kristo@ti.com
References: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
Message-ID: <9603a894-495b-3c73-0916-aea52f98fe9f@lechnology.com>
Date:   Mon, 4 Jan 2021 14:11:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216165239.2744-1-grzegorz.jaszczyk@linaro.org>
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


> Please see the individual patches for exact changes in each patch, following is
> the only change from v1:
>  - Change the 'prus' property name to 'ti,prus' as suggested by Rob Herring,
>  which influences patch #1 and patch #2

It looks like "soc: ti: pruss: Add pruss_{request, release}_mem_region() API"
was also dropped in v2. Was this intentional?
