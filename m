Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7F12EFBBC
	for <lists+linux-omap@lfdr.de>; Sat,  9 Jan 2021 00:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbhAHXex (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Jan 2021 18:34:53 -0500
Received: from vern.gendns.com ([98.142.107.122]:34544 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbhAHXex (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 8 Jan 2021 18:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1byDzLX7PLFqYa4MN8gCIY7S5iSbUJGZSpSg/yf9kEg=; b=y8pE8/GEQUWn2abxRzDV1KHl4j
        r9eS3FOLBwjvtXMrHOdZdeH7ha0Ygt+4UjdQO8d/6J5lsF/X74kpHn2/+jliXSMqMphUwIRNV50Ng
        xtGVwTxZhoJ/aJ0JsjimuvhwYQfMCj5XmAdzWOGRD88iIsWeOwR8XuyNOYBjugpMOXrFzVJIa98v3
        g6eojONbw8BAith5kva3wlRF3LXL4NpQ49cBfLPTgPVxqnYtsjwIaupmScp37ZP6DusSg7UPp94bu
        a2QZxgZ+c/A+74cqd36PtPj626AjNEQhvv4TC6dGrWEGH2q5FVL04RMxHIEAQJ0mW+fhDjVAMwf2K
        8kDYVHZA==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:55968 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1ky1Gj-00086l-7O; Fri, 08 Jan 2021 18:34:09 -0500
Subject: Re: [PATCH] irqchip: Simplify the TI_PRUSS_INTC Kconfig
To:     Suman Anna <s-anna@ti.com>, Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
References: <20210108162901.6003-1-s-anna@ti.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <8a1fc38a-af44-925b-a621-b9da8a0df537@lechnology.com>
Date:   Fri, 8 Jan 2021 17:34:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108162901.6003-1-s-anna@ti.com>
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

On 1/8/21 10:29 AM, Suman Anna wrote:
> The TI PRUSS INTC irqchip driver handles the local interrupt controller
> which is a child device of it's parent PRUSS/ICSSG device. The driver
> was upstreamed in parallel with the PRUSS platform driver, and was
> configurable independently previously. The PRUSS interrupt controller
> is an integral part of the overall PRUSS software architecture, and is
> not useful at all by itself.
> 
> Simplify the TI_PRUSS_INTC Kconfig dependencies by making it silent and
> selected automatically when the TI_PRUSS platform driver is enabled.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---

Reviewed-by: David Lechner <david@lechnology.com>

