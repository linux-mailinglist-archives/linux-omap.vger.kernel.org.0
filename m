Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80EC5868C7
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 20:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732375AbfHHSbR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 14:31:17 -0400
Received: from vern.gendns.com ([98.142.107.122]:43280 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730768AbfHHSbR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 8 Aug 2019 14:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=k+1f28Co3TjdHmZl1rlhm+kOz4AR49O/Mpi9garM/o8=; b=T253WssJdV+B1/qYDP8IDrHEMd
        Mc6yBdZbZIQqgPGnOIeJ5G8d2lXC+B4pkxwIKQBHZ/6lB8RIVb/++nLJIKkLcmLIiKfBKnAiiN/fd
        pY/VaBNVxtXkW7dCp0DqLrSXFnPkDCmJNp25WI5fyRsJuRtqUmdRltBJI8eONdf6OKoEl3SN1HrgP
        dly1x9y4ewxybRxSAacJOJCZgDpEVW1HjLiyuVJwX4wjEikHSOx6FPkuzzS87a8agpEMSkYn1BQym
        a6lXtn/oKyVemLh8uZhlEcfHeNuznzzmi1imzw0qNPkzBySo/iRG2EOtBH0O6I87k8k4yzso9YDg5
        3ZqsCAdg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:34972 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hvnBs-0001Fi-VV; Thu, 08 Aug 2019 14:31:09 -0400
Subject: Re: [PATCH v2 4/6] irqchip/irq-pruss-intc: Add helper functions to
 configure internal mapping
From:   David Lechner <david@lechnology.com>
To:     Suman Anna <s-anna@ti.com>, Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
Cc:     Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
        "Andrew F. Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190731224149.11153-1-s-anna@ti.com>
 <20190731224149.11153-5-s-anna@ti.com>
 <1a63eb50-7c5c-eb3d-3cbe-bd1cc59ce3fe@kernel.org>
 <89abc27f-5d02-a8ce-df0e-b185c2a647cd@ti.com>
 <1ac233f6-f3a3-6cec-9ad2-49e985fdfaca@lechnology.com>
 <6c17875e-496d-1277-278f-239d3a9d8ca2@ti.com>
 <124b03b8-f8e7-682b-8767-13a739329da2@lechnology.com>
Message-ID: <5a81f82a-2cba-7ec5-ced2-714516319d6a@lechnology.com>
Date:   Thu, 8 Aug 2019 13:31:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <124b03b8-f8e7-682b-8767-13a739329da2@lechnology.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 8/8/19 12:09 PM, David Lechner wrote:
> 
> Then we can provide a vendor resource hook in the remoteproc driver to handle
> these resources:
> 
> static int ti_pru_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
>                     int offset, int avail)
> {
>      struct ti_pru_data *pru = rproc->priv;
>      struct irq_fwspec fwspec;
>      unsigned int virq;
> 
>      switch (rsc_type) {
>      case TI_PRU_VENDOR_RESOURCE_IRQ:
>      {
>          struct ti_pru_vendor_resource_irq *rsc_irq = rsc;
> 
>          fwspec.fwnode = pru->intc_fwnode;
>          fwspec.param[0] = le32_to_cpu(rsc_irq->event);
>          fwspec.param[1] = le32_to_cpu(rsc_irq->channel);
>          fwspec.param[2] = le32_to_cpu(rsc_irq->host);
>          fwspec.param[3] = le32_to_cpu(rsc_irq->domain);
>          fwspec.param_count = 4;
>      }
>          break;
>      case TI_PRU_VENDOR_RESOURCE_IRQ2:
>      {
>          struct ti_pru_vendor_resource_irq2 *rsc_irq2 = rsc;
> 
>          fwspec.fwnode = pru->intc_fwnode;
>          fwspec.param[0] = le32_to_cpu(rsc_irq2->event);
>          fwspec.param[1] = le32_to_cpu(rsc_irq2->evt_sel);
>          fwspec.param[2] = le32_to_cpu(rsc_irq2->channel);
>          fwspec.param[3] = le32_to_cpu(rsc_irq2->host);
>          fwspec.param[4] = le32_to_cpu(rsc_irq2->domain);
>          fwspec.param_count = 5;
>          break;
>      }
>      default:
>          return RSC_IGNORED;
>      }
> 
>      virq = irq_create_fwspec_mapping(&fwspec);
>      if (!virq)
>          return -EINVAL;
> 
>      /* TODO: save virq (and other metadata) for later use */
> 
>      return RSC_HANDLED;
> }
> 
> static const struct rproc_ops ti_pru_rproc_ops = {
>      .start = ti_pru_rproc_start,
>      .stop = ti_pru_rproc_stop,
>      .kick = ti_pru_rproc_kick,
>      .da_to_va = ti_pru_rproc_da_to_va,
>      .handle_rsc = ti_pru_rproc_handle_rsc,
> };
> 

After re-reading some of the previous discussions, it sounds like
we wouldn't want to always map every IRQ in the firmware resource
table.

In that case, we could implement the rproc_ops parse_fw callback
instead. All firmware nodes could be collected (from both the
firmware resource table and device tree) and the remoteproc driver
could decide which ones need to be mapped and which ones don't.
Then it could call irq_create_fwspec_mapping() only the nodes
that need to be mapped based on the current application.
