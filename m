Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B768E3A4443
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jun 2021 16:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhFKOoh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 10:44:37 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37462 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbhFKOoh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 10:44:37 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15BEgaxN121016;
        Fri, 11 Jun 2021 09:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623422556;
        bh=Mobi30OvBrpqIbv/uBePOiJWgHswL7dLG0G2epYZiFg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=E0elCKYEK+Aoqf92qXvAKfqaQ9C1lrj2cdbDVRq8662k1Q4fHqNbgEUlgJxn6Nqoa
         LzCI2SRAnPVWhAfxDpoc2FuyTMNtU/QFdY8cJlF3cWgcocX0+7FKh67LFx6WRAGC9z
         gxyKnoJlcZELVuPLo7rQS0gRydBaOvYsmmhxHVTs=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15BEga9l107372
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Jun 2021 09:42:36 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 09:42:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 09:42:36 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15BEgZUY037135;
        Fri, 11 Jun 2021 09:42:35 -0500
Subject: Re: Patches for espresso3g
To:     Mighty M <mightymb17@gmail.com>, <philipp@uvos.xyz>
CC:     <linux-omap@vger.kernel.org>
References: <CACLAQJE+bybY4SZx==M0_MY+_S9-r7F=Go9HOi2WjwNXfSsdeQ@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <5001931f-00e2-5666-fb48-ede0ffb145e6@ti.com>
Date:   Fri, 11 Jun 2021 17:42:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACLAQJE+bybY4SZx==M0_MY+_S9-r7F=Go9HOi2WjwNXfSsdeQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 11/06/2021 17:31, Mighty M wrote:
> Adding support for Samsung Galaxy Tab 2 (7 inch)
> Cc: linux-omap@vger.kernel.org
> ---
Pls,
- add properer description
- split DT, config, code changes


-- 
Best regards,
grygorii
