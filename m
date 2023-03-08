Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47BDC6B0621
	for <lists+linux-omap@lfdr.de>; Wed,  8 Mar 2023 12:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjCHLjt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Mar 2023 06:39:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjCHLjo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Mar 2023 06:39:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38BFEB79F2;
        Wed,  8 Mar 2023 03:39:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B31ADB81C29;
        Wed,  8 Mar 2023 11:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952CCC433EF;
        Wed,  8 Mar 2023 11:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678275579;
        bh=1C8N+oNcWYgkJ4s4xeYwTpBkWgvClPXBJ1vP56zGl+Y=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jrA9cZ1cVWavfUzK+HsBMKD1A3U0PpinwY3TS/7vxa1uOVrxNhUQllLkJuPGLWanL
         PsAvq0HgHnzn/Fljh+Fj4WFhFxxhckRkCwpn1cSiu+zyLwR/TkimrgC/zhmRLB1dpp
         SE/SMKFLeJ2JPu/maVDDAhD5MHaq8LL00iopLONqxFnxYiQfeC5AvDsZXG1bq+1YpN
         fa39KT+KuTeZ0YET0qSnVIQu/CznVT8Ix0DLFf3ZfqK5eixxWLLMPYfDEUAXjhAvwT
         DF4UBJnhlQ3Y8jDlcfkyGlGvuJ9MqPLsQzUmFWtrufQMJ4D9a8YxbQaIK0VL0gHoT9
         p00078TppPVdw==
Message-ID: <f061fc6c-0b17-3e7f-ccae-9fb980d1e546@kernel.org>
Date:   Wed, 8 Mar 2023 13:39:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [PATCH v3 4/6] soc: ti: pruss: Add
 helper functions to set GPI mode, MII_RT_event and XFR
Content-Language: en-US
To:     Md Danish Anwar <a0501179@ti.com>,
        MD Danish Anwar <danishanwar@ti.com>,
        "Andrew F. Davis" <afd@ti.com>, Suman Anna <s-anna@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Nishanth Menon <nm@ti.com>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, srk@ti.com, devicetree@vger.kernel.org,
        netdev@vger.kernel.org
References: <20230306110934.2736465-1-danishanwar@ti.com>
 <20230306110934.2736465-5-danishanwar@ti.com>
 <2f039534-dd21-7361-0fcd-b91da1636a3a@kernel.org>
 <ed3dd4b6-658f-07d2-a055-4c38f2ec9db0@ti.com>
 <93228d2f-0fc8-0c0e-f5ea-f55ed72da908@kernel.org>
 <a24dd8ef-e720-7bb5-b8d6-f168afd96233@ti.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <a24dd8ef-e720-7bb5-b8d6-f168afd96233@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 08/03/2023 13:29, Md Danish Anwar wrote:
> 
> 
> On 08/03/23 16:45, Roger Quadros wrote:
>>
>>
>> On 08/03/2023 11:23, Md Danish Anwar wrote:
>>> Hi Roger,
>>>
>>> On 08/03/23 14:04, Roger Quadros wrote:
>>>> Hi Danish,
>>>>
>>>> On 06/03/2023 13:09, MD Danish Anwar wrote:
>>>>> From: Suman Anna <s-anna@ti.com>
>>>>>
>>>>> The PRUSS CFG module is represented as a syscon node and is currently
>>>>> managed by the PRUSS platform driver. Add easy accessor functions to set
>>>>> GPI mode, MII_RT event enable/disable and XFR (XIN XOUT) enable/disable
>>>>> to enable the PRUSS Ethernet usecase. These functions reuse the generic
>>>>> pruss_cfg_update() API function.
>>>>>
>>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>>> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>>>>> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>>>>> Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
>>>>> ---
>>>>>  include/linux/remoteproc/pruss.h | 55 ++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 55 insertions(+)
>>>>>
>>>>> diff --git a/include/linux/remoteproc/pruss.h b/include/linux/remoteproc/pruss.h
>>>>> index d41bec448f06..7952f250301a 100644
>>>>> --- a/include/linux/remoteproc/pruss.h
>>>>> +++ b/include/linux/remoteproc/pruss.h
>>>>> @@ -240,4 +240,59 @@ static inline bool is_pru_rproc(struct device *dev)
>>>>>  	return true;
>>>>>  }
>>>>>  
>>>>> +/**
>>>>> + * pruss_cfg_gpimode() - set the GPI mode of the PRU
>>>>> + * @pruss: the pruss instance handle
>>>>> + * @pru_id: id of the PRU core within the PRUSS
>>>>> + * @mode: GPI mode to set
>>>>> + *
>>>>> + * Sets the GPI mode for a given PRU by programming the
>>>>> + * corresponding PRUSS_CFG_GPCFGx register
>>>>> + *
>>>>> + * Return: 0 on success, or an error code otherwise
>>>>> + */
>>>>> +static inline int pruss_cfg_gpimode(struct pruss *pruss,
>>>>> +				    enum pruss_pru_id pru_id,
>>>>> +				    enum pruss_gpi_mode mode)
>>>>> +{
>>>>> +	if (pru_id < 0 || pru_id >= PRUSS_NUM_PRUS)
>>>>> +		return -EINVAL;
>>>>> +
>>>>
>>>> Should we check for invalid gpi mode and error out if so?
>>>>
>>> Sure we can check for invalid gpi mode.
>>>
>>> Does the below code snippet looks good to you?
>>>
>>> 	if(mode < PRUSS_GPI_MODE_DIRECT || mode > PRUSS_GPI_MODE_MII)
>>
>> How about?
>> 	if (mode < 0 || mode > PRUSS_GPI_MODE_MAX)
>>
> 
> Sure that would be better. But we will have to introduce PRUSS_GPI_MODE_MAX in
> the enum definition.
> 
> Also the if() should check for mode >= PRUSS_GPI_MODE_MAX so the if check will
> become,
> 
> 	if (mode < 0 || mode >= PRUSS_GPI_MODE_MAX)
> 		return -EINVAL;
> 
> enum definition,
> 
> enum pruss_gpi_mode {
> 	PRUSS_GPI_MODE_DIRECT = 0,
> 	PRUSS_GPI_MODE_PARALLEL,
> 	PRUSS_GPI_MODE_28BIT_SHIFT,
> 	PRUSS_GPI_MODE_MII,
> 	PRUSS_GPI_MODE_MAX,
> };
> 

Yes. Looks good.

>>> 		return -EINVAL;
>>>
>>>>> +	return pruss_cfg_update(pruss, PRUSS_CFG_GPCFG(pru_id),
>>>>> +				PRUSS_GPCFG_PRU_GPI_MODE_MASK,
>>>>> +				mode << PRUSS_GPCFG_PRU_GPI_MODE_SHIFT);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * pruss_cfg_miirt_enable() - Enable/disable MII RT Events
>>>>> + * @pruss: the pruss instance
>>>>> + * @enable: enable/disable
>>>>> + *
>>>>> + * Enable/disable the MII RT Events for the PRUSS.
>>>>> + *
>>>>> + * Return: 0 on success, or an error code otherwise
>>>>> + */
>>>>> +static inline int pruss_cfg_miirt_enable(struct pruss *pruss, bool enable)
>>>>> +{
>>>>> +	u32 set = enable ? PRUSS_MII_RT_EVENT_EN : 0;
>>>>> +
>>>>> +	return pruss_cfg_update(pruss, PRUSS_CFG_MII_RT,
>>>>> +				PRUSS_MII_RT_EVENT_EN, set);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * pruss_cfg_xfr_enable() - Enable/disable XIN XOUT shift functionality
>>>>> + * @pruss: the pruss instance
>>>>> + * @enable: enable/disable
>>>>> + *
>>>>> + * Return: 0 on success, or an error code otherwise
>>>>> + */
>>>>> +static inline int pruss_cfg_xfr_enable(struct pruss *pruss, bool enable)
>>>>> +{
>>>>> +	u32 set = enable ? PRUSS_SPP_XFER_SHIFT_EN : 0;
>>>>> +
>>>>> +	return pruss_cfg_update(pruss, PRUSS_CFG_SPP,
>>>>> +				PRUSS_SPP_XFER_SHIFT_EN, set);
>>>>> +}
>>>>> +
>>>>>  #endif /* __LINUX_PRUSS_H */
>>>>
>>
>> cheers,
>> -roger
> 
