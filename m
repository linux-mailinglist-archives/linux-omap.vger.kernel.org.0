Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D64451C88
	for <lists+linux-omap@lfdr.de>; Mon, 24 Jun 2019 22:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731562AbfFXUjk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jun 2019 16:39:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41604 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbfFXUjj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Jun 2019 16:39:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OKdZCS077530;
        Mon, 24 Jun 2019 15:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561408775;
        bh=oIggU2usg7ip92ERe3n8UI5GnQ67C5U97I7Ca1/uLxw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PXmZABqByRnONJkq4IlV58VJMYG2qoNypXsSXYUb9lYL8kntL4D1kvhndujxPF8ZW
         1go4rpAo3ktU3Up5YbUgyQLWcPKFsctVlVxZSUpo44VbxwZJJuikzMMdsDAJOsJR2G
         G9UFie8rQJdHNniqlGTm16JM62GsByKyV2pS13iM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OKdZD1076634
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Jun 2019 15:39:35 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 24
 Jun 2019 15:39:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 24 Jun 2019 15:39:34 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5OKdYHJ075028;
        Mon, 24 Jun 2019 15:39:34 -0500
Subject: Re: [PATCH 0/2] Add Mailbox support for TI K3 SoCs
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20190604170146.12205-1-s-anna@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <47b8f278-85ff-18be-d5a0-fde9de6e17f2@ti.com>
Date:   Mon, 24 Jun 2019 15:39:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190604170146.12205-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Jassi,

On 6/4/19 12:01 PM, Suman Anna wrote:
> Hi Jassi,
> 
> The following series adds the support for the Mailbox IP present
> within the Main NavSS module on the newer TI K3 AM65x and J721E SoCs.
> 
> The Mailbox IP is similar to the previous generation IP on OMAP SoCs
> with a few differences:
>  - Multiple IP instances from previous DRA7/AM57 family each form a
>    cluster and are part of the same IP. The driver support will continue
>    to be based on a cluster.
>  - The IP is present within a Main NaVSS, and interrupts have to go
>    through an Interrupt Router within Main NavSS before they reach the
>    respective processor sub-system's interrupt controllers.
>  - The register layout is mostly same, with difference in two registers
> 
> Support is added by enhancing the existing OMAP Mailbox driver to 
> support the K3 IP using a new compatible. The driver also has to be
> adjusted to deal with the 32-bit mailbox payloads vs the 64-bit 
> pointers used by the Mailbox API on these Arm v8 platforms.
> 
> DT nodes will be posted separately once the binding is acked.

Can you please pick this series up for 5.3 merge window if you do not
have any comments.

Thanks,
Suman

> 
> Suman Anna (2):
>   dt-bindings: mailbox: omap: Update bindings for TI K3 SoCs
>   mailbox/omap: Add support for TI K3 SoCs
> 
>  .../bindings/mailbox/omap-mailbox.txt         | 59 ++++++++++++++++---
>  drivers/mailbox/Kconfig                       |  2 +-
>  drivers/mailbox/omap-mailbox.c                | 43 ++++++++------
>  include/linux/omap-mailbox.h                  |  4 +-
>  4 files changed, 80 insertions(+), 28 deletions(-)
> 

