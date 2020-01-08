Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A377D1343EC
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2020 14:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbgAHNfb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Jan 2020 08:35:31 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:32990 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgAHNfb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Jan 2020 08:35:31 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008DZGhq110034;
        Wed, 8 Jan 2020 07:35:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578490516;
        bh=Mm+aQW4c+5WaDj/N2HzmeOCdIlB6jBSyEgt1OZ7cqAw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sQHwcf5MggXXcp/dmSJKv5rAqVgUkrzDzH57p/zoslHDTQ5Q3God2U6EBDbL5Uwnb
         +l+gdE1ap5ECtnnOYcZZuoxg8tNQ5v7GchN8xAlIEeFuprrsUjxV7p6GhDcU55fVJ3
         v1es4lleUzi5PMUmEkpXBoeF5d3KsXjO5hRPPuLY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008DZF8J049930
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 8 Jan 2020 07:35:15 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 07:35:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 07:35:14 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008DZBH5117693;
        Wed, 8 Jan 2020 07:35:12 -0600
Subject: Re: [PATCH v4 03/11] mmc: sdhci: add support for using external DMA
 devices
To:     Baolin Wang <baolin.wang7@gmail.com>,
        Faiz Abbas <faiz_abbas@ti.com>
CC:     <linux-omap@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>, <kishon@ti.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, <tony@atomide.com>
References: <20200106110133.13791-1-faiz_abbas@ti.com>
 <20200106110133.13791-4-faiz_abbas@ti.com>
 <CADBw62onwxPmn=HmdL05hz+FOUe9crRPDO+CB5hDmaVeYMSTsQ@mail.gmail.com>
 <48c10fdf-f2c7-a719-2f64-0f87895f3704@ti.com>
 <CADBw62rK1a9K7cxf5ti7YkFsJJ5tJ+8yjuF2aYR3PnZnoK-r2g@mail.gmail.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <f599735e-83f7-5afc-ebe6-168f0157d2c3@ti.com>
Date:   Wed, 8 Jan 2020 15:35:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADBw62rK1a9K7cxf5ti7YkFsJJ5tJ+8yjuF2aYR3PnZnoK-r2g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 08/01/2020 11.29, Baolin Wang wrote:
> Hi Faiz,
> 
> On Wed, Jan 8, 2020 at 5:19 PM Faiz Abbas <faiz_abbas@ti.com> wrote:
>>
>> Hi Baolin,
>>
>> On 08/01/20 6:58 am, Baolin Wang wrote:
>>> Hi Faiz,
>>>
>>> On Mon, Jan 6, 2020 at 7:01 PM Faiz Abbas <faiz_abbas@ti.com> wrote:
>>>>
>>>> From: Chunyan Zhang <zhang.chunyan@linaro.org>
>>>>
>>>> Some standard SD host controllers can support both external dma
>>>> controllers as well as ADMA/SDMA in which the SD host controller
>>>> acts as DMA master. TI's omap controller is the case as an example.
>>>>
>>>> Currently the generic SDHCI code supports ADMA/SDMA integrated in
>>>> the host controller but does not have any support for external DMA
>>>> controllers implemented using dmaengine, meaning that custom code is
>>>> needed for any systems that use an external DMA controller with SDHCI.
>>>>
>>>> Fixes by Faiz Abbas <faiz_abbas@ti.com>:
>>>> 1. Map scatterlists before dmaengine_prep_slave_sg()
>>>> 2. Use dma_async() functions inside of the send_command() path and call
>>>> terminate_sync() in non-atomic context in case of an error.
>>>>
>>>> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
>>>> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
>>>> ---
>>>>  drivers/mmc/host/Kconfig |   3 +
>>>>  drivers/mmc/host/sdhci.c | 228 ++++++++++++++++++++++++++++++++++++++-
>>>>  drivers/mmc/host/sdhci.h |   8 ++
>>>>  3 files changed, 237 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
>>>> index d06b2dfe3c95..adef971582a1 100644
>>>> --- a/drivers/mmc/host/Kconfig
>>>> +++ b/drivers/mmc/host/Kconfig
>>>> @@ -1040,3 +1040,6 @@ config MMC_OWL
>>>>         help
>>>>           This selects support for the SD/MMC Host Controller on
>>>>           Actions Semi Owl SoCs.
>>>> +
>>>> +config MMC_SDHCI_EXTERNAL_DMA
>>>> +       bool
>>>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>>>> index f6999054abcf..8cc78c76bc3d 100644
>>>> --- a/drivers/mmc/host/sdhci.c
>>>> +++ b/drivers/mmc/host/sdhci.c
>>>> @@ -10,6 +10,7 @@
>>>>   */
>>>>
>>>>  #include <linux/delay.h>
>>>> +#include <linux/dmaengine.h>
>>>>  #include <linux/ktime.h>
>>>>  #include <linux/highmem.h>
>>>>  #include <linux/io.h>
>>>> @@ -1157,6 +1158,188 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
>>>>         sdhci_set_block_info(host, data);
>>>>  }
>>>>
>>>> +#if IS_ENABLED(CONFIG_MMC_SDHCI_EXTERNAL_DMA)
>>>> +
>>>> +static int sdhci_external_dma_init(struct sdhci_host *host)
>>>> +{
>>>> +       int ret = 0;
>>>> +       struct mmc_host *mmc = host->mmc;
>>>> +
>>>> +       host->tx_chan = dma_request_chan(mmc->parent, "tx");
>>>> +       if (IS_ERR(host->tx_chan)) {
>>>> +               ret = PTR_ERR(host->tx_chan);
>>>> +               if (ret != -EPROBE_DEFER)
>>>> +                       pr_warn("Failed to request TX DMA channel.\n");
>>>> +               host->tx_chan = NULL;
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       host->rx_chan = dma_request_chan(mmc->parent, "rx");
>>>> +       if (IS_ERR(host->rx_chan)) {
>>>> +               if (host->tx_chan) {
>>>> +                       dma_release_channel(host->tx_chan);
>>>> +                       host->tx_chan = NULL;
>>>> +               }
>>>> +
>>>> +               ret = PTR_ERR(host->rx_chan);
>>>> +               if (ret != -EPROBE_DEFER)
>>>> +                       pr_warn("Failed to request RX DMA channel.\n");
>>>> +               host->rx_chan = NULL;
>>>> +       }
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +
>>>> +static struct dma_chan *sdhci_external_dma_channel(struct sdhci_host *host,
>>>> +                                                  struct mmc_data *data)
>>>> +{
>>>> +       return data->flags & MMC_DATA_WRITE ? host->tx_chan : host->rx_chan;
>>>> +}
>>>> +
>>>> +static int sdhci_external_dma_setup(struct sdhci_host *host,
>>>> +                                   struct mmc_command *cmd)
>>>> +{
>>>> +       int ret, i;
>>>> +       struct dma_async_tx_descriptor *desc;
>>>> +       struct mmc_data *data = cmd->data;
>>>> +       struct dma_chan *chan;
>>>> +       struct dma_slave_config cfg;
>>>> +       dma_cookie_t cookie;
>>>> +       int sg_cnt;
>>>> +
>>>> +       if (!host->mapbase)
>>>> +               return -EINVAL;
>>>> +
>>>> +       cfg.src_addr = host->mapbase + SDHCI_BUFFER;
>>>> +       cfg.dst_addr = host->mapbase + SDHCI_BUFFER;
>>>> +       cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>>>> +       cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>>>> +       cfg.src_maxburst = data->blksz / 4;
>>>> +       cfg.dst_maxburst = data->blksz / 4;
>>>> +
>>>> +       /* Sanity check: all the SG entries must be aligned by block size. */
>>>> +       for (i = 0; i < data->sg_len; i++) {
>>>> +               if ((data->sg + i)->length % data->blksz)
>>>> +                       return -EINVAL;
>>>> +       }
>>>> +
>>>> +       chan = sdhci_external_dma_channel(host, data);
>>>> +
>>>> +       ret = dmaengine_slave_config(chan, &cfg);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +
>>>> +       sg_cnt = sdhci_pre_dma_transfer(host, data, COOKIE_MAPPED);
>>>> +       if (sg_cnt <= 0)
>>>> +               return -EINVAL;
>>>> +
>>>> +       desc = dmaengine_prep_slave_sg(chan, data->sg, data->sg_len,
>>>> +                                      mmc_get_dma_dir(data),
>>>> +                                      DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>>>> +       if (!desc)
>>>> +               return -EINVAL;
>>>> +
>>>> +       desc->callback = NULL;
>>>> +       desc->callback_param = NULL;
>>>> +
>>>> +       cookie = dmaengine_submit(desc);
>>>> +       if (cookie < 0)
>>>
>>> We usually use the DMA engine standard API: dma_submit_error() to
>>> validate the cookie.
>>>
>>
>> The if condition is doing the same thing as the API. Do we really
>> require it?
> 
> Yes, now it did the same thing. But in future if the DMA engine expand
> the cookie indication, which may break your current condition, but use
> dma_submit_error() is more safe, that will help to cover the internal
> cookie things. So I recommend to use the standard API as far as
> possible.

dma_cookie_t is typedefed to s32 currently, but it could change. The
cookie is for DMA engine internal tracking.
Clients should not use it directly for doing arithmetic on it.

> But if Ulf does not care about this, it's Okay for me too :)
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
