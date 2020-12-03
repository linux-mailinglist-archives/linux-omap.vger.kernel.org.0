Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 117162CE2DC
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 00:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387519AbgLCXoo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Dec 2020 18:44:44 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33596 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgLCXoo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Dec 2020 18:44:44 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B3Ngxa8030668;
        Thu, 3 Dec 2020 17:42:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607038979;
        bh=9zbGjKmxuYXN0pqTb9zM6K/iA2tRQReLGqHlofF3IE8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VO7t7/+/+bo0PjVCXFgDrZs1zPxpp8DAVTx6cpJEiedj2hNQeJ2uWLAsXof3zBEOz
         6Ys7+M6l7Myy7iB/Gaoyl7hG8pb+WwfdAd9+aRsdhmQ/VcSK6o57EBN+ZDzhaWcw0t
         4NORm0DGWVTFJRT0KEVCJERv8Pu1SA/fDHMGhAAs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B3NgxJY022102
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Dec 2020 17:42:59 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 3 Dec
 2020 17:42:58 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 3 Dec 2020 17:42:58 -0600
Received: from [10.250.38.244] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B3NgwtS010777;
        Thu, 3 Dec 2020 17:42:58 -0600
Subject: Re: [PATCH v2 2/6] remoteproc/pru: Add a PRU remoteproc driver
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
CC:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <robh+dt@kernel.org>,
        <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <rogerq@ti.com>
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org>
 <20201119140850.12268-3-grzegorz.jaszczyk@linaro.org>
 <20201201225436.GB1240310@xps15> <20201202205336.GD1282360@xps15>
 <20201202211358.GE1282360@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <1b661532-6846-1c60-6dc7-11bd23709e20@ti.com>
Date:   Thu, 3 Dec 2020 17:42:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202211358.GE1282360@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Mathieu,

On 12/2/20 3:13 PM, Mathieu Poirier wrote:
> On Wed, Dec 02, 2020 at 01:53:36PM -0700, Mathieu Poirier wrote:
>> On Tue, Dec 01, 2020 at 03:54:36PM -0700, Mathieu Poirier wrote:
>>> Hi Grzeg,
>>>
>>> I have started to review this set - comments will come over the next few days.
>>>
>>> See below for a start. 
>>>
>>> On Thu, Nov 19, 2020 at 03:08:46PM +0100, Grzegorz Jaszczyk wrote:
>>>> From: Suman Anna <s-anna@ti.com>
>>>>
>>>> The Programmable Real-Time Unit Subsystem (PRUSS) consists of
>>>> dual 32-bit RISC cores (Programmable Real-Time Units, or PRUs)
>>>> for program execution. This patch adds a remoteproc platform
>>>> driver for managing the individual PRU RISC cores life cycle.
>>>>
>>>> The PRUs do not have a unified address space (have an Instruction
>>>> RAM and a primary Data RAM at both 0x0). The PRU remoteproc driver
>>>> therefore uses a custom remoteproc core ELF loader ops. The added
>>>> .da_to_va ops is only used to provide translations for the PRU
>>>> Data RAMs. This remoteproc driver does not have support for error
>>>> recovery and system suspend/resume features. Different compatibles
>>>> are used to allow providing scalability for instance-specific device
>>>> data if needed. The driver uses a default firmware-name retrieved
>>>> from device-tree for each PRU core, and the firmwares are expected
>>>> to be present in the standard Linux firmware search paths. They can
>>>> also be adjusted by userspace if required through the sysfs interface
>>>> provided by the remoteproc core.
>>>>
>>>> The PRU remoteproc driver uses a client-driven boot methodology: it
>>>> does _not_ support auto-boot so that the PRU load and boot is dictated
>>>> by the corresponding client drivers for achieving various usecases.
>>>> This allows flexibility for the client drivers or applications to set
>>>> a firmware name (if needed) based on their desired functionality and
>>>> boot the PRU. The sysfs bind and unbind attributes have also been
>>>> suppressed so that the PRU devices cannot be unbound and thereby
>>>> shutdown a PRU from underneath a PRU client driver.
>>>>
>>>> The driver currently supports the AM335x, AM437x, AM57xx and 66AK2G
>>>> SoCs, and support for other TI SoCs will be added in subsequent
>>>> patches.
>>>>
>>>> Co-developed-by: Andrew F. Davis <afd@ti.com>
>>>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>>>> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>>>> ---
>>>> v1->v2:
>>>> - Use PRU_IRAM_ADDR_MASK definition instead of raw 0x3ffff.
>>>> - Convert 'len' argument from int to size_t type in all *da_to_va.
>>>> - Return 0 in case of missing .resource_table for pru_rproc_parse_fw()
>>>>   (move the logic from patch #3 where it was corrected).
>>>> ---
>>>>  drivers/remoteproc/Kconfig     |  12 +
>>>>  drivers/remoteproc/Makefile    |   1 +
>>>>  drivers/remoteproc/pru_rproc.c | 435 +++++++++++++++++++++++++++++++++
>>>>  3 files changed, 448 insertions(+)
>>>>  create mode 100644 drivers/remoteproc/pru_rproc.c
>>>>
>>>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>>> index d99548fb5dde..3e3865a7cd78 100644
>>>> --- a/drivers/remoteproc/Kconfig
>>>> +++ b/drivers/remoteproc/Kconfig
>>>> @@ -125,6 +125,18 @@ config KEYSTONE_REMOTEPROC
>>>>  	  It's safe to say N here if you're not interested in the Keystone
>>>>  	  DSPs or just want to use a bare minimum kernel.
>>>>  
>>>> +config PRU_REMOTEPROC
>>>> +	tristate "TI PRU remoteproc support"
>>>> +	depends on TI_PRUSS
>>>> +	default TI_PRUSS
>>>> +	help
>>>> +	  Support for TI PRU remote processors present within a PRU-ICSS
>>>> +	  subsystem via the remote processor framework.
>>>> +
>>>> +	  Say Y or M here to support the Programmable Realtime Unit (PRU)
>>>> +	  processors on various TI SoCs. It's safe to say N here if you're
>>>> +	  not interested in the PRU or if you are unsure.
>>>> +
>>>>  config QCOM_PIL_INFO
>>>>  	tristate
>>>>  
>>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>>> index da2ace4ec86c..bb26c9e4ef9c 100644
>>>> --- a/drivers/remoteproc/Makefile
>>>> +++ b/drivers/remoteproc/Makefile
>>>> @@ -18,6 +18,7 @@ obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
>>>>  obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
>>>>  obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
>>>>  obj-$(CONFIG_KEYSTONE_REMOTEPROC)	+= keystone_remoteproc.o
>>>> +obj-$(CONFIG_PRU_REMOTEPROC)		+= pru_rproc.o
>>>>  obj-$(CONFIG_QCOM_PIL_INFO)		+= qcom_pil_info.o
>>>>  obj-$(CONFIG_QCOM_RPROC_COMMON)		+= qcom_common.o
>>>>  obj-$(CONFIG_QCOM_Q6V5_COMMON)		+= qcom_q6v5.o
>>>> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
>>>> new file mode 100644
>>>> index 000000000000..b686f19f9b1a
>>>> --- /dev/null
>>>> +++ b/drivers/remoteproc/pru_rproc.c
>>>> @@ -0,0 +1,435 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * PRU-ICSS remoteproc driver for various TI SoCs
>>>> + *
>>>> + * Copyright (C) 2014-2020 Texas Instruments Incorporated - https://www.ti.com/
>>>> + *
>>>> + * Author(s):
>>>> + *	Suman Anna <s-anna@ti.com>
>>>> + *	Andrew F. Davis <afd@ti.com>
>>>> + *	Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org> for Texas Instruments
>>>> + */
>>>> +
>>>> +#include <linux/bitops.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of_device.h>
>>>> +#include <linux/pruss_driver.h>
>>>> +#include <linux/remoteproc.h>
>>>> +
>>>> +#include "remoteproc_internal.h"
>>>> +#include "remoteproc_elf_helpers.h"
>>>> +
>>>> +/* PRU_ICSS_PRU_CTRL registers */
>>>> +#define PRU_CTRL_CTRL		0x0000
>>>> +#define PRU_CTRL_STS		0x0004
>>>> +
>>>> +/* CTRL register bit-fields */
>>>> +#define CTRL_CTRL_SOFT_RST_N	BIT(0)
>>>> +#define CTRL_CTRL_EN		BIT(1)
>>>> +#define CTRL_CTRL_SLEEPING	BIT(2)
>>>> +#define CTRL_CTRL_CTR_EN	BIT(3)
>>>> +#define CTRL_CTRL_SINGLE_STEP	BIT(8)
>>>> +#define CTRL_CTRL_RUNSTATE	BIT(15)
>>>> +
>>>> +/* PRU Core IRAM address masks */
>>>> +#define PRU_IRAM_ADDR_MASK	0x3ffff
>>>> +#define PRU0_IRAM_ADDR_MASK	0x34000
>>>> +#define PRU1_IRAM_ADDR_MASK	0x38000
>>>> +
>>>> +/* PRU device addresses for various type of PRU RAMs */
>>>> +#define PRU_IRAM_DA	0	/* Instruction RAM */
>>>> +#define PRU_PDRAM_DA	0	/* Primary Data RAM */
>>>> +#define PRU_SDRAM_DA	0x2000	/* Secondary Data RAM */
>>>> +#define PRU_SHRDRAM_DA	0x10000 /* Shared Data RAM */
>>>> +
>>>> +/**
>>>> + * enum pru_iomem - PRU core memory/register range identifiers
>>>> + *
>>>> + * @PRU_IOMEM_IRAM: PRU Instruction RAM range
>>>> + * @PRU_IOMEM_CTRL: PRU Control register range
>>>> + * @PRU_IOMEM_DEBUG: PRU Debug register range
>>>> + * @PRU_IOMEM_MAX: just keep this one at the end
>>>> + */
>>>> +enum pru_iomem {
>>>> +	PRU_IOMEM_IRAM = 0,
>>>> +	PRU_IOMEM_CTRL,
>>>> +	PRU_IOMEM_DEBUG,
>>>> +	PRU_IOMEM_MAX,
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct pru_rproc - PRU remoteproc structure
>>>> + * @id: id of the PRU core within the PRUSS
>>>> + * @dev: PRU core device pointer
>>>> + * @pruss: back-reference to parent PRUSS structure
>>>> + * @rproc: remoteproc pointer for this PRU core
>>>> + * @mem_regions: data for each of the PRU memory regions
>>>> + * @fw_name: name of firmware image used during loading
>>>> + */
>>>> +struct pru_rproc {
>>>> +	int id;
>>>> +	struct device *dev;
>>>> +	struct pruss *pruss;
>>>> +	struct rproc *rproc;
>>>> +	struct pruss_mem_region mem_regions[PRU_IOMEM_MAX];
>>>> +	const char *fw_name;
>>>> +};
>>>> +
>>>> +static inline u32 pru_control_read_reg(struct pru_rproc *pru, unsigned int reg)
>>>> +{
>>>> +	return readl_relaxed(pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
>>>> +}
>>>> +
>>>> +static inline
>>>> +void pru_control_write_reg(struct pru_rproc *pru, unsigned int reg, u32 val)
>>>> +{
>>>> +	writel_relaxed(val, pru->mem_regions[PRU_IOMEM_CTRL].va + reg);
>>>> +}
>>>> +
>>>> +static int pru_rproc_start(struct rproc *rproc)
>>>> +{
>>>> +	struct device *dev = &rproc->dev;
>>>> +	struct pru_rproc *pru = rproc->priv;
>>>> +	u32 val;
>>>> +
>>>> +	dev_dbg(dev, "starting PRU%d: entry-point = 0x%llx\n",
>>>> +		pru->id, (rproc->bootaddr >> 2));
>>>> +
>>>> +	val = CTRL_CTRL_EN | ((rproc->bootaddr >> 2) << 16);
>>>> +	pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int pru_rproc_stop(struct rproc *rproc)
>>>> +{
>>>> +	struct device *dev = &rproc->dev;
>>>> +	struct pru_rproc *pru = rproc->priv;
>>>> +	u32 val;
>>>> +
>>>> +	dev_dbg(dev, "stopping PRU%d\n", pru->id);
>>>> +
>>>> +	val = pru_control_read_reg(pru, PRU_CTRL_CTRL);
>>>> +	val &= ~CTRL_CTRL_EN;
>>>> +	pru_control_write_reg(pru, PRU_CTRL_CTRL, val);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Convert PRU device address (data spaces only) to kernel virtual address.
>>>> + *
>>>> + * Each PRU has access to all data memories within the PRUSS, accessible at
>>>> + * different ranges. So, look through both its primary and secondary Data
>>>> + * RAMs as well as any shared Data RAM to convert a PRU device address to
>>>> + * kernel virtual address. Data RAM0 is primary Data RAM for PRU0 and Data
>>>> + * RAM1 is primary Data RAM for PRU1.
>>>> + */
>>>> +static void *pru_d_da_to_va(struct pru_rproc *pru, u32 da, size_t len)
>>>> +{
>>>> +	struct pruss_mem_region dram0, dram1, shrd_ram;
>>>> +	struct pruss *pruss = pru->pruss;
>>>> +	u32 offset;
>>>> +	void *va = NULL;
>>>> +
>>>> +	if (len == 0)
>>>> +		return NULL;
>>>> +
>>>> +	dram0 = pruss->mem_regions[PRUSS_MEM_DRAM0];
>>>> +	dram1 = pruss->mem_regions[PRUSS_MEM_DRAM1];
>>>> +	/* PRU1 has its local RAM addresses reversed */
>>>> +	if (pru->id == 1)
>>>> +		swap(dram0, dram1);
>>>> +	shrd_ram = pruss->mem_regions[PRUSS_MEM_SHRD_RAM2];
>>>> +
>>>> +	if (da >= PRU_PDRAM_DA && da + len <= PRU_PDRAM_DA + dram0.size) {
>>>> +		offset = da - PRU_PDRAM_DA;
>>>> +		va = (__force void *)(dram0.va + offset);
>>>> +	} else if (da >= PRU_SDRAM_DA &&
>>>> +		   da + len <= PRU_SDRAM_DA + dram1.size) {
>>>> +		offset = da - PRU_SDRAM_DA;
>>>> +		va = (__force void *)(dram1.va + offset);
>>>> +	} else if (da >= PRU_SHRDRAM_DA &&
>>>> +		   da + len <= PRU_SHRDRAM_DA + shrd_ram.size) {
>>>> +		offset = da - PRU_SHRDRAM_DA;
>>>> +		va = (__force void *)(shrd_ram.va + offset);
>>>> +	}
>>>> +
>>>> +	return va;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Convert PRU device address (instruction space) to kernel virtual address.
>>>> + *
>>>> + * A PRU does not have an unified address space. Each PRU has its very own
>>>> + * private Instruction RAM, and its device address is identical to that of
>>>> + * its primary Data RAM device address.
>>>> + */
>>>> +static void *pru_i_da_to_va(struct pru_rproc *pru, u32 da, size_t len)
>>>> +{
>>>> +	u32 offset;
>>>> +	void *va = NULL;
>>>> +
>>>> +	if (len == 0)
>>>> +		return NULL;
>>>> +
>>>> +	if (da >= PRU_IRAM_DA &&
>>>> +	    da + len <= PRU_IRAM_DA + pru->mem_regions[PRU_IOMEM_IRAM].size) {
>>>> +		offset = da - PRU_IRAM_DA;
>>>> +		va = (__force void *)(pru->mem_regions[PRU_IOMEM_IRAM].va +
>>>> +				      offset);
>>>> +	}
>>>> +
>>>> +	return va;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Provide address translations for only PRU Data RAMs through the remoteproc
>>>> + * core for any PRU client drivers. The PRU Instruction RAM access is restricted
>>>> + * only to the PRU loader code.
>>>> + */
>>>> +static void *pru_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
>>>> +{
>>>> +	struct pru_rproc *pru = rproc->priv;
>>>> +
>>>> +	return pru_d_da_to_va(pru, da, len);
>>>> +}
>>>> +
>>>> +/* PRU-specific address translator used by PRU loader. */
>>>> +static void *pru_da_to_va(struct rproc *rproc, u64 da, size_t len, bool is_iram)
>>>> +{
>>>> +	struct pru_rproc *pru = rproc->priv;
>>>> +	void *va;
>>>> +
>>>> +	if (is_iram)
>>>> +		va = pru_i_da_to_va(pru, da, len);
>>>> +	else
>>>> +		va = pru_d_da_to_va(pru, da, len);
>>>> +
>>>> +	return va;
>>>> +}
>>>> +
>>>> +static struct rproc_ops pru_rproc_ops = {
>>>> +	.start		= pru_rproc_start,
>>>> +	.stop		= pru_rproc_stop,
>>>> +	.da_to_va	= pru_rproc_da_to_va,
>>>> +};
>>>> +
>>>> +static int
>>>> +pru_rproc_load_elf_segments(struct rproc *rproc, const struct firmware *fw)
>>>> +{
>>>> +	struct device *dev = &rproc->dev;
>>>> +	struct elf32_hdr *ehdr;
>>>> +	struct elf32_phdr *phdr;
>>>> +	int i, ret = 0;
>>>> +	const u8 *elf_data = fw->data;
>>>> +
>>>> +	ehdr = (struct elf32_hdr *)elf_data;
>>>> +	phdr = (struct elf32_phdr *)(elf_data + ehdr->e_phoff);
>>>> +
>>>> +	/* go through the available ELF segments */
>>>> +	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
>>>> +		u32 da = phdr->p_paddr;
>>>> +		u32 memsz = phdr->p_memsz;
>>>> +		u32 filesz = phdr->p_filesz;
>>>> +		u32 offset = phdr->p_offset;
>>>> +		bool is_iram;
>>>> +		void *ptr;
>>>> +
>>>> +		if (phdr->p_type != PT_LOAD)
>>>> +			continue;
>>>> +
>>>> +		dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
>>>> +			phdr->p_type, da, memsz, filesz);
>>>> +
>>>> +		if (filesz > memsz) {
>>>> +			dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
>>>> +				filesz, memsz);
>>>> +			ret = -EINVAL;
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		if (offset + filesz > fw->size) {
>>>> +			dev_err(dev, "truncated fw: need 0x%x avail 0x%zx\n",
>>>> +				offset + filesz, fw->size);
>>>> +			ret = -EINVAL;
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		/* grab the kernel address for this device address */
>>>> +		is_iram = phdr->p_flags & PF_X;
>>>> +		ptr = pru_da_to_va(rproc, da, memsz, is_iram);
>>>> +		if (!ptr) {
>>>> +			dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
>>>> +			ret = -EINVAL;
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		/* skip the memzero logic performed by remoteproc ELF loader */
>>>> +		if (!phdr->p_filesz)
>>>> +			continue;
>>>
>>> I don't see the need to do all this if phdr->p_filesz is not valid.  I would move
>>> this below the check for PT_LOAD above.  Otherwise people are looking for some
>>> kind of hidden logic when there isn't any.  The comment should probably go
>>> after the memcpy().
>>

Agreed.

Greg, perhaps you can use the variable filesz directly when you move it up for v3.

>> ... and thinking futher on this, it would be nice to know why the memory isn't
>> zero'ed out when a discrepency exists between the segment size in memory and the
>> segment size in the image.  Right now all we know is that it isn't done.

The memset is always kinda of an optimization, it is strictly not needed by
loader code. Also, for PRUs, IIRC, especially on K3 SoCs, we would have to use a
custom memset to overcome the same limitations as with memcpy, so we dropped it.

regards
Suman

>>
> 
> With the above:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
>>>
>>> I am running out of time for today and will continue tomorrow.
>>>
>>>> +
>>>> +		memcpy(ptr, elf_data + phdr->p_offset, filesz);
>>>> +	}
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Use a custom parse_fw callback function for dealing with PRU firmware
>>>> + * specific sections.
>>>> + */
>>>> +static int pru_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	/* load optional rsc table */
>>>> +	ret = rproc_elf_load_rsc_table(rproc, fw);
>>>> +	if (ret == -EINVAL)
>>>> +		dev_dbg(&rproc->dev, "no resource table found for this fw\n");
>>>> +	else if (ret)
>>>> +		return ret;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Compute PRU id based on the IRAM addresses. The PRU IRAMs are
>>>> + * always at a particular offset within the PRUSS address space.
>>>> + */
>>>> +static int pru_rproc_set_id(struct pru_rproc *pru)
>>>> +{
>>>> +	int ret = 0;
>>>> +
>>>> +	switch (pru->mem_regions[PRU_IOMEM_IRAM].pa & PRU_IRAM_ADDR_MASK) {
>>>> +	case PRU0_IRAM_ADDR_MASK:
>>>> +		pru->id = 0;
>>>> +		break;
>>>> +	case PRU1_IRAM_ADDR_MASK:
>>>> +		pru->id = 1;
>>>> +		break;
>>>> +	default:
>>>> +		ret = -EINVAL;
>>>> +	}
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int pru_rproc_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct device *dev = &pdev->dev;
>>>> +	struct device_node *np = dev->of_node;
>>>> +	struct platform_device *ppdev = to_platform_device(dev->parent);
>>>> +	struct pru_rproc *pru;
>>>> +	const char *fw_name;
>>>> +	struct rproc *rproc = NULL;
>>>> +	struct resource *res;
>>>> +	int i, ret;
>>>> +	const char *mem_names[PRU_IOMEM_MAX] = { "iram", "control", "debug" };
>>>> +
>>>> +	ret = of_property_read_string(np, "firmware-name", &fw_name);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "unable to retrieve firmware-name %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	rproc = devm_rproc_alloc(dev, pdev->name, &pru_rproc_ops, fw_name,
>>>> +				 sizeof(*pru));
>>>> +	if (!rproc) {
>>>> +		dev_err(dev, "rproc_alloc failed\n");
>>>> +		return -ENOMEM;
>>>> +	}
>>>> +	/* use a custom load function to deal with PRU-specific quirks */
>>>> +	rproc->ops->load = pru_rproc_load_elf_segments;
>>>> +
>>>> +	/* use a custom parse function to deal with PRU-specific resources */
>>>> +	rproc->ops->parse_fw = pru_rproc_parse_fw;
>>>> +
>>>> +	/* error recovery is not supported for PRUs */
>>>> +	rproc->recovery_disabled = true;
>>>> +
>>>> +	/*
>>>> +	 * rproc_add will auto-boot the processor normally, but this is not
>>>> +	 * desired with PRU client driven boot-flow methodology. A PRU
>>>> +	 * application/client driver will boot the corresponding PRU
>>>> +	 * remote-processor as part of its state machine either through the
>>>> +	 * remoteproc sysfs interface or through the equivalent kernel API.
>>>> +	 */
>>>> +	rproc->auto_boot = false;
>>>> +
>>>> +	pru = rproc->priv;
>>>> +	pru->dev = dev;
>>>> +	pru->pruss = platform_get_drvdata(ppdev);
>>>> +	pru->rproc = rproc;
>>>> +	pru->fw_name = fw_name;
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(mem_names); i++) {
>>>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>>> +						   mem_names[i]);
>>>> +		pru->mem_regions[i].va = devm_ioremap_resource(dev, res);
>>>> +		if (IS_ERR(pru->mem_regions[i].va)) {
>>>> +			dev_err(dev, "failed to parse and map memory resource %d %s\n",
>>>> +				i, mem_names[i]);
>>>> +			ret = PTR_ERR(pru->mem_regions[i].va);
>>>> +			return ret;
>>>> +		}
>>>> +		pru->mem_regions[i].pa = res->start;
>>>> +		pru->mem_regions[i].size = resource_size(res);
>>>> +
>>>> +		dev_dbg(dev, "memory %8s: pa %pa size 0x%zx va %pK\n",
>>>> +			mem_names[i], &pru->mem_regions[i].pa,
>>>> +			pru->mem_regions[i].size, pru->mem_regions[i].va);
>>>> +	}
>>>> +
>>>> +	ret = pru_rproc_set_id(pru);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	platform_set_drvdata(pdev, rproc);
>>>> +
>>>> +	ret = devm_rproc_add(dev, pru->rproc);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "rproc_add failed: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	dev_dbg(dev, "PRU rproc node %pOF probed successfully\n", np);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int pru_rproc_remove(struct platform_device *pdev)
>>>> +{
>>>> +	struct device *dev = &pdev->dev;
>>>> +	struct rproc *rproc = platform_get_drvdata(pdev);
>>>> +
>>>> +	dev_dbg(dev, "%s: removing rproc %s\n", __func__, rproc->name);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static const struct of_device_id pru_rproc_match[] = {
>>>> +	{ .compatible = "ti,am3356-pru", },
>>>> +	{ .compatible = "ti,am4376-pru", },
>>>> +	{ .compatible = "ti,am5728-pru", },
>>>> +	{ .compatible = "ti,k2g-pru",    },
>>>> +	{},
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, pru_rproc_match);
>>>> +
>>>> +static struct platform_driver pru_rproc_driver = {
>>>> +	.driver = {
>>>> +		.name   = "pru-rproc",
>>>> +		.of_match_table = pru_rproc_match,
>>>> +		.suppress_bind_attrs = true,
>>>> +	},
>>>> +	.probe  = pru_rproc_probe,
>>>> +	.remove = pru_rproc_remove,
>>>> +};
>>>> +module_platform_driver(pru_rproc_driver);
>>>> +
>>>> +MODULE_AUTHOR("Suman Anna <s-anna@ti.com>");
>>>> +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
>>>> +MODULE_AUTHOR("Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>");
>>>> +MODULE_DESCRIPTION("PRU-ICSS Remote Processor Driver");
>>>> +MODULE_LICENSE("GPL v2");
>>>> -- 
>>>> 2.29.0
>>>>

