Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041B8303600
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 06:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389044AbhAZF5X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 00:57:23 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45960 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730878AbhAZCFm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jan 2021 21:05:42 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10Q0GdCH124859;
        Mon, 25 Jan 2021 18:16:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611620199;
        bh=L+f4ohZrdj488CP3I7uIPQegEJlAgJImjluiVuvJrcA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SvdgqdQS3ePBAKHWoAKSIOh32WDJ+cxGIFBElawyaWhStFSv569KvJA+sx84x2f6E
         3yIjZq8TUh857IyO1M0YpXcPcQOOsbr9jG96QKAfogSsDBdF/LoRXFh7Z4psbqqnrx
         IqrA2p762TzawbT/tnwaamFTLnq/c1nMHi0XQob8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10Q0Gdcd047151
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 Jan 2021 18:16:39 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 Jan 2021 18:16:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 Jan 2021 18:16:38 -0600
Received: from [10.250.69.64] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10Q0GcAE007721;
        Mon, 25 Jan 2021 18:16:38 -0600
Subject: Re: [PATCH] dt-bindings: irqchip: Add #address-cells to PRUSS INTC
To:     Rob Herring <robh@kernel.org>
CC:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Lechner <david@lechnology.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
References: <20210115205819.19426-1-s-anna@ti.com>
 <20210126000443.GA1223706@robh.at.kernel.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <8f4a47f8-18dc-cb73-10db-033e5e5adb25@ti.com>
Date:   Mon, 25 Jan 2021 18:16:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126000443.GA1223706@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

<<< No Message Collected >>>
