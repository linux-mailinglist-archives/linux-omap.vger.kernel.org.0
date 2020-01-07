Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75AF0132054
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 08:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbgAGHU5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 02:20:57 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54456 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgAGHU4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 02:20:56 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0077KiOm005644;
        Tue, 7 Jan 2020 01:20:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578381644;
        bh=BNhB0QYJdnTNKSIqndUpxLZ1sEMIsh0Psb5ghyCVu+M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sBK7wzvoGwFHA11fk7gIMQf/8nPtBhOEfXzdpeK80AL7nNx3A3JaDNvy404X+kJNr
         7bh7MZSm2xZXhiA7MaKoBELuu5n6P7KfVMIX6bEyj8qchymhrAX+HE1KjAq4OVlKUx
         QnEIk8biuH+RnA33DcXM9kj2f7mUw79O9sccGXOw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0077KiLJ097488
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Jan 2020 01:20:44 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 01:20:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 01:20:44 -0600
Received: from [172.24.190.4] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0077KeUj039368;
        Tue, 7 Jan 2020 01:20:41 -0600
Subject: Re: [PATCH v4 02/11] mmc: sdhci: Factor out some operations set to
 their own functions
To:     Baolin Wang <baolin.wang7@gmail.com>
CC:     <linux-omap@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>, <kishon@ti.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, <tony@atomide.com>
References: <20200106110133.13791-1-faiz_abbas@ti.com>
 <20200106110133.13791-3-faiz_abbas@ti.com>
 <CADBw62qR5F8h4YbpWfU2UESeoR3zXzS=eePMvQHuT7NQE5hdSA@mail.gmail.com>
From:   Faiz Abbas <faiz_abbas@ti.com>
Message-ID: <27fded85-d195-0a82-899a-bb6e727258dc@ti.com>
Date:   Tue, 7 Jan 2020 12:52:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CADBw62qR5F8h4YbpWfU2UESeoR3zXzS=eePMvQHuT7NQE5hdSA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Baolin,

On 07/01/20 12:04 pm, Baolin Wang wrote:
> Hi Faiz,
> 
> On Mon, Jan 6, 2020 at 7:01 PM Faiz Abbas <faiz_abbas@ti.com> wrote:
>>
>> In preparation for adding external dma support, factor out data initialization,
>> block info and mrq_done to their own functions.
>>
>> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
>> ---
>>  drivers/mmc/host/sdhci.c | 96 +++++++++++++++++++++++-----------------
>>  1 file changed, 55 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>> index 1b1c26da3fe0..f6999054abcf 100644
>> --- a/drivers/mmc/host/sdhci.c
>> +++ b/drivers/mmc/host/sdhci.c
>> @@ -1025,18 +1025,9 @@ static void sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
>>         }
>>  }
>>
>> -static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
>> +static void sdhci_initialize_data(struct sdhci_host *host,
>> +                                 struct mmc_data *data)
>>  {
>> -       struct mmc_data *data = cmd->data;
>> -
>> -       host->data_timeout = 0;
>> -
>> -       if (sdhci_data_line_cmd(cmd))
>> -               sdhci_set_timeout(host, cmd);
>> -
>> -       if (!data)
>> -               return;
>> -
>>         WARN_ON(host->data);
>>
>>         /* Sanity checks */
>> @@ -1048,6 +1039,36 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
>>         host->data_early = 0;
>>         host->data->bytes_xfered = 0;
>>
> 
> Can you remove above redundant blank line?
Ok.
> 
>> +}
>> +
>> +static inline void sdhci_set_block_info(struct sdhci_host *host,
>> +                                       struct mmc_data *data)
>> +{
>> +
> 
> Ditto.
Ok.
> 
> Otherwise, please add my tested tag if feel free.
> 
> Tested-by: Baolin Wang <baolin.wang7@gmail.com>

Which platform did you test this on?

Thanks,
Faiz
